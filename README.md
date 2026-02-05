# Полезные ссылки

- [Баллы по ASD](https://docs.google.com/spreadsheets/d/1bGFiA8Eo_DvWwFljG4edc0qvXsTRar_i4uNBJmT5bsw/edit?gid=1912560175#gid=1912560175)
- [Баллы по FOP](https://docs.google.com/spreadsheets/d/1GTl2TBVT9YfGlgxQIdV7kKY6a2BRGWOhak8Hak2qGR4/edit?gid=1073736648#gid=1073736648)
- [Баллы по HCS](https://docs.google.com/spreadsheets/d/1Fg8CyfE-FV7MlQK7UYd6pZMjm1zwF7B7aUvHGTa74i0/edit?usp=sharing)
- [Баллы по DMT](https://docs.google.com/spreadsheets/d/1ioa07uZc3p1_mYloL2Q9qOKUoB0xMRf0FazWk7S8x7w)
- [Баллы по MTA](https://docs.google.com/spreadsheets/u/0/d/1fgorOF58GTGqqGotcrEy-ApDqolgkyYoZhGi8Lgad_0/htmlview?pli=1#gid=0)
- [Баллы по LAG](https://docs.google.com/spreadsheets/d/1diG6kbAqrQydG8pr27GNW5KFmlqpW0o81D3Os74mpd4/edit?gid=0#gid=0)
- [Yonote ASD](https://dm-aisd.yonote.ru/share/itmo_dm_aisd)
- [Overleaf MTA](https://www.overleaf.com/read/yvghqskxpjzb#f94883)
- [Github DMT](https://github.com/Lipen/discrete-math-course?tab=readme-ov-file)
- [Cloud MTA+LAG(от Бакеевой)](https://cloud.mail.ru/public/enTY/4HcyZiM5E)

---
# Правила работы с репозиторием

Этот репозиторий предназначен для хранения теоретических материалов (конспекты, записи занятий, билеты) по курсам наших основных дисциплин. Участие в жизни репозитория широко приветствуется и засчитывается в карму.

Для добавления нового файла или изменения существующего:
1. создаётся отдельная ветка — коммитить в `master` **запрещено**! 
2. когда материал готов, открывается PR из созданной ветки;
3. PR проходит ревью (*пожалуйста, делайте ревью!*) и вливается в `master`;
4. после этого новая ветка сразу же удаляется.

В конце семестра содержимое ветки `master` переносится в отдельку ветку `semester-x`, после чего сам `master` очищается под новый семестр.

---

# Структура репозитория

Семестровая ветка содержит папки под все материалы по каждому отдельному предмету. Внутри предметной директории под каждую тему создаётся ещё одна папка, которая содержит:
1. исходник (LaTeX/Markdown/Typst), если он есть;
2. рендер в .pdf;
3. папка `resources` со связанными материалами, если это необходимо.

Несколько лекций на одну тему объединяются в одну запись.

---
# Нейминг

##### Нейминг файлов

Все файлы и папки должны быть названы на английском языке. В качестве разделителя используется дефис (`-`).
Названия папок должны отражать их содержание. В имени папки также должен содержаться номер соответствующей темы. Названия исходных и отрендеренных файлов полностью дублируют имя директорий, в которых они содержатся, за исключением номера темы.
##### Названия дисциплин

- `fop` — основы программирования (*fundamentals of programming → fop*)
- `ads` — алгоритмы и структуры данных (*algorithms and data structures → ads*)
- `dmt` — дискретная математика (*discrete math → dmt*)
- `mta` — математический анализ (*mathematical analysis → mta*)
- `lag` — линейная алгебра (*linear algebra → lag*)
- `fmt` — специальные разделы высшей математики (*further math → fmt*)
- `hcs` — аппаратное обеспечение вычислительных систем (*hardware of computing systems → hcs*)

##### Технический нейминг

Коммиты именуются согласно формату`[<subject>][<id>]: <commit-message>`, где:
- `<subject>` -— сокращенное название дисциплины;
- `<id>` — номер соответствующей темы; если его нет, указывается `xx`;
- `<commit-message>` — информация о коммите.


Ветки именуются согласно формату `<subject>-<id>`.


PR именуются согласно формату `[<subject>][<id>]`. В описании указывается патчноут со всеми внесёнными изменениями.

---
