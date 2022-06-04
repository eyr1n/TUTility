{
  const awaitMap = (array, func) => Promise.all(array.map(func));

  const fetchDom = async (url) => {
    const response = await fetch(url).catch(() => {});
    if (!response) return;
    const text = await response.text().catch(() => {});
    if (!text) return;
    return new DOMParser().parseFromString(text, 'text/html');
  };

  const cache = new Map();

  (async () => {
    const json = await awaitMap(Array.from(document.querySelectorAll('#tblLecture > tbody > tr')).slice(2), (row) =>
      awaitMap(Array.from(row.querySelectorAll(':scope > td')).slice(1, 6), (col) =>
        awaitMap(
          Array.from(col.querySelectorAll(':scope > div > div > div:not(.cancel-done) > span[id$="_lblSbjName"] > a')),
          async (item) => {
            if (cache.has(item.href)) {
              return cache.get(item.href);
            }

            const syllabusUrlParams = new URL(item.href).searchParams;
            const scheduleUrl = new URL('https://kyomu.office.tut.ac.jp/portal/StudentApp/Lct/LectureList.aspx');
            scheduleUrl.searchParams.append('lct_year', syllabusUrlParams.get('lct_year'));
            scheduleUrl.searchParams.append('lct_cd', syllabusUrlParams.get('lct_cd'));
            const room =
              (await fetchDom(scheduleUrl))
                ?.querySelector('#ctl00_phContents_ucLctList_gv > tbody > tr:nth-child(2) > td:nth-child(5)')
                ?.innerText.trim() ?? '';

            const dom = await fetchDom(item.href);
            const params = {
              id: dom.getElementById('ctl00_phContents_Detail_lbl_lct_cd')?.innerText.trim() ?? '',
              name: dom.getElementById('ctl00_phContents_Detail_lbl_sbj_name')?.innerText.trim() ?? '',
              area: dom.getElementById('ctl00_phContents_Detail_lbl_sbj_area_name')?.innerText.trim() ?? '',
              term: dom.getElementById('ctl00_phContents_Detail_lbl_term_name')?.innerText.trim() ?? '',
              required: dom.getElementById('ctl00_phContents_Detail_lbl_req_name')?.innerText.trim() ?? '',
              units: dom.getElementById('ctl00_phContents_Detail_lbl_credits')?.innerText.trim() ?? '',
              grade: dom.getElementById('ctl00_phContents_Detail_lbl_open_grad_name')?.innerText.trim() ?? '',
              staff: dom.getElementById('ctl00_phContents_Detail_lbl_staff_name')?.innerText.trim() ?? '',
              syllabus: item.href,
              room,
            };

            cache.set(item.href, params);
            return params;
          }
        )
      )
    );

    GetTimetable.postMessage(JSON.stringify(json));
  })();
}
