function getTimetable() {
  let year = null;
  const getFirstOrNull = (arr) => arr.length > 0 ? arr[0] : null;
  const getTextOrNull = (elm) => {
    const text = elm?.innerText.trim();
    return text ? text : null;
  };
  const getSubject = (elm) => {
    const subject = elm.querySelector(
      'span[id$="_lblSbjName"] > a'
    );
    if (!subject) {
      return null;
    }
    const cancel = getTextOrNull(
      elm.querySelector('span[id$="_lblCancelName"]')
    );
    const duringLot = getTextOrNull(
      elm.querySelector('span[id$="_lblAdjustName"]')
    );
    if (duringLot === "\u62BD\u9078\u5BFE\u8C61") {
      return {
        id: "during_lot",
        url: "",
        name: "\u62BD\u9078\u4E2D",
        required: null,
        term: null,
        units: null,
        staff: null
      };
    }
    const lotResult = getTextOrNull(
      elm.querySelector('span[id$="_lblLotResultName"]')
    );
    if (lotResult && lotResult !== "\u5F53\u9078") {
      return null;
    }
    const id = getTextOrNull(elm.querySelector('span[id$="_lblLctCd"]'));
    const url = new URL(subject.href);
    const name = getTextOrNull(subject);
    const required = getTextOrNull(
      elm.querySelector('span[id$="_lblSbjDivName"]')
    );
    const term = getTextOrNull(elm.querySelector('span[id$="_lblTermName"]'));
    const units = getTextOrNull(elm.querySelector('span[id$="_lblCredit"]'));
    const staff = getTextOrNull(elm.querySelector('span[id$="_lblStaffName"]'));
    if (!year) {
      year = url.searchParams.get("lct_year");
    }
    if (!id || !name) {
      throw new Error("failed");
    }
    return {
      id,
      url: url.toString(),
      name,
      required,
      term,
      units,
      staff
    };
  };
  try {
    const belong = getTextOrNull(
      document.querySelector("#ctl00_bhHeader_lblBelong")
    );
    const semester = document.querySelector("#ctl00_phContents_ddlTerm")?.value === "1" ? "spring" : "fall";
    const normal = [
      ...document.querySelectorAll(
        "#tblLecture > tbody > tr"
      )
    ].slice(2, 8).map(
      (row) => [...row.querySelectorAll(":scope > td")].slice(1, 6).map(
        (col) => [
          ...col.querySelectorAll(
            ':scope > div > div[id$="_divDetail"]'
          )
        ].flatMap((elm) => getSubject(elm) ?? [])
      )
    );
    const firstHalf = normal.map(
      (row) => row.map(
        (col) => getFirstOrNull(
          col.filter((subject) => {
            switch (semester) {
              case "spring":
                return !subject.term?.includes("\u524D\u671F\uFF12") && !subject.term?.includes("\u524D\uFF12");
              case "fall":
                return !subject.term?.includes("\u5F8C\u671F\uFF12") && !subject.term?.includes("\u5F8C\uFF12");
              default:
                return true;
            }
          })
        )
      )
    );
    const secondHalf = normal.map(
      (row) => row.map(
        (col) => getFirstOrNull(
          col.filter((subject) => {
            switch (semester) {
              case "spring":
                return !subject.term?.includes("\u524D\u671F\uFF11") && !subject.term?.includes("\u524D\uFF11");
              case "fall":
                return !subject.term?.includes("\u5F8C\u671F\uFF11") && !subject.term?.includes("\u5F8C\uFF11");
              default:
                return true;
            }
          })
        )
      )
    );
    const intensive = [
      ...document.querySelectorAll(
        "#tblOhters > tbody > tr"
      )
    ].map(
      (row) => [...row.querySelectorAll(":scope > td")].slice(1).map((col) => {
        const elm = col.querySelector(
          ':scope > div > div[id$="_divDetail"]'
        );
        return elm ? getSubject(elm) : null;
      })
    );
    if (!year || !belong) {
      throw new Error("failed");
    }
    return {
      year,
      belong,
      semester,
      firstHalf,
      secondHalf,
      intensive
    };
  } catch {
    return null;
  }
}
