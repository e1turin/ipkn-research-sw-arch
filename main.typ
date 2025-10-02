#import "prelude.typ": *
#import "title_page.typ": *

#let title = ""
#let author = "Тюрин Иван Николаевич"

#show: thesis_format.with(
  title,
  author,
  title_page: title_page(
    about: [О подготовке введения в научно исследовательскую работу],
    theme: [Моделирование и анализ архитектур программных систем с помощью графов],
    student: [#author, группа M4120],
    university_manager: [Синица Александр Михайлович],
    date: datetime(year: 2025, month: 05, day: 29).display("[day].[month].[year]"),
  ),
)

#bibliography("bibliography.bib")
