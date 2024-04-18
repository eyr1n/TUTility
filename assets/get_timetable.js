function getTimetable() {
  const term =
    document.querySelector("#ctl00_phContents_ddlTerm").value === "1"
      ? "spring"
      : "fall";

  const normal = [...document.querySelectorAll("#tblLecture > tbody > tr")]
    .slice(2)
    .map((row) =>
      [...row.querySelectorAll(":scope > td")]
        .slice(1, 7)
        .map((col) =>
          [
            ...col.querySelectorAll(':scope > div > div[id$="_divDetail"]'),
          ].flatMap((item) => getSubject(item) ?? [])
        )
    );

  const intensive = [
    ...document.querySelectorAll("#tblOhters > tbody > tr"),
  ].map((row) =>
    [...row.querySelectorAll(":scope > td")]
      .slice(1, 7)
      .map((col) =>
        [
          ...col.querySelectorAll(':scope > div > div[id$="_divDetail"]'),
        ].flatMap((item) => getSubject(item) ?? [])
      )
  );

  return {
    year: 2024,
    term,
    normal,
    intensive,
  };
}

function getSubject(divDetail) {
  const subject = divDetail.querySelector('span[id$="_lblSbjName"] > a');
  if (subject) {
    const id = divDetail.querySelector('span[id$="_lblLctCd"]')?.innerText;
    const url = new URL(subject.href);
    const name = subject.innerText;
    const term = divDetail.querySelector('span[id$="_lblTermName"]')?.innerText;
    const required = divDetail
      .querySelector('span[id$="_lblSbjDivName"]')
      ?.innerText.slice(1, -1);
    const grade = divDetail.querySelector('span[id$="_lblCredit"]')?.innerText;
    const staff = divDetail.querySelector(
      'span[id$="_lblStaffName"]'
    )?.innerText;

    return {
      id,
      url: url.toString(),
      name,
      term,
      required,
      grade,
      staff,
    };
  }
}
