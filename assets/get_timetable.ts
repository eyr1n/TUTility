interface Subject {
  id: string;
  url: string;
  name: string;
  required: string | null;
  term: string | null;
  units: string | null;
  staff: string | null;
}

interface Timetable {
  year: string;
  belong: string;
  semester: "spring" | "fall";
  firstHalf: (Subject | null)[][];
  secondHalf: (Subject | null)[][];
  intensive: (Subject | null)[][];
}

function getTimetable(): Timetable | null {
  let year: string | null = null;

  const getFirstOrNull = <T>(arr: T[]) => (arr.length > 0 ? arr[0] : null);

  const getTextOrNull = (elm: HTMLElement | null) => {
    const text = elm?.innerText.trim();
    return text ? text : null;
  };

  const getSubject = (elm: HTMLElement): Subject | null => {
    const subject = elm.querySelector<HTMLAnchorElement>(
      'span[id$="_lblSbjName"] > a'
    );
    if (!subject) {
      return null;
    }

    // TODO: キャンセル済み科目を除外
    const cancel = getTextOrNull(
      elm.querySelector('span[id$="_lblCancelName"]')
    );

    // 抽選中科目を置換, 当選科目以外を除外
    const duringLot = getTextOrNull(
      elm.querySelector('span[id$="_lblAdjustName"]')
    );
    if (duringLot === "抽選対象") {
      return {
        id: "during_lot",
        url: "",
        name: "抽選中",
        required: null,
        term: null,
        units: null,
        staff: null,
      };
    }
    const lotResult = getTextOrNull(
      elm.querySelector('span[id$="_lblLotResultName"]')
    );
    if (lotResult && lotResult !== "当選") {
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
      staff,
    };
  };

  try {
    const belong = getTextOrNull(
      document.querySelector<HTMLSpanElement>("#ctl00_bhHeader_lblBelong")
    );

    const semester =
      document.querySelector<HTMLSelectElement>("#ctl00_phContents_ddlTerm")
        ?.value === "1"
        ? "spring"
        : "fall";

    const normal = [
      ...document.querySelectorAll<HTMLTableRowElement>(
        "#tblLecture > tbody > tr"
      ),
    ]
      .slice(2, 8)
      .map((row) =>
        [...row.querySelectorAll<HTMLTableCellElement>(":scope > td")]
          .slice(1, 6)
          .map((col) =>
            [
              ...col.querySelectorAll<HTMLDivElement>(
                ':scope > div > div[id$="_divDetail"]'
              ),
            ].flatMap((elm) => getSubject(elm) ?? [])
          )
      );

    const firstHalf = normal.map((row) =>
      row.map((col) =>
        getFirstOrNull(
          col.filter((subject) => {
            switch (semester) {
              case "spring":
                return (
                  !subject.term?.includes("前期２") &&
                  !subject.term?.includes("前２")
                );
              case "fall":
                return (
                  !subject.term?.includes("後期２") &&
                  !subject.term?.includes("後２")
                );
              default:
                return true;
            }
          })
        )
      )
    );

    const secondHalf = normal.map((row) =>
      row.map((col) =>
        getFirstOrNull(
          col.filter((subject) => {
            switch (semester) {
              case "spring":
                return (
                  !subject.term?.includes("前期１") &&
                  !subject.term?.includes("前１")
                );
              case "fall":
                return (
                  !subject.term?.includes("後期１") &&
                  !subject.term?.includes("後１")
                );
              default:
                return true;
            }
          })
        )
      )
    );

    const intensive = [
      ...document.querySelectorAll<HTMLTableRowElement>(
        "#tblOhters > tbody > tr"
      ),
    ].map((row) =>
      [...row.querySelectorAll<HTMLTableCellElement>(":scope > td")]
        .slice(1)
        .map((col) => {
          const elm = col.querySelector<HTMLDivElement>(
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
      intensive,
    };
  } catch {
    return null;
  }
}
