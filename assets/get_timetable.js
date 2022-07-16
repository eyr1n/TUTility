(() => {
  let year = null;

  const timetable = Array.from(document.querySelectorAll('#tblLecture > tbody > tr'))
    .slice(2)
    .map((row) =>
      Array.from(row.querySelectorAll(':scope > td'))
        .slice(1, 6)
        .map((col) =>
          Array.from(col.querySelectorAll(':scope > div > div > div > span[id$="_lblSbjName"] > a')).map((item) => {
            const url = new URL(item.href);
            if (!year) year = url.searchParams.get('lct_year');
            return url.searchParams.get('lct_cd');
          })
        )
    );

  return JSON.stringify({
    year,
    timetable,
  });
})();
