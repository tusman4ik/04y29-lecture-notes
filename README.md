# Полезные ссылки: 
- [Баллы по ASD](https://docs.google.com/spreadsheets/d/1bGFiA8Eo_DvWwFljG4edc0qvXsTRar_i4uNBJmT5bsw/edit?gid=1912560175#gid=1912560175)
- [Баллы по FOP](https://docs.google.com/spreadsheets/d/1GTl2TBVT9YfGlgxQIdV7kKY6a2BRGWOhak8Hak2qGR4/edit?gid=1073736648#gid=1073736648)
- [Баллы по DMT](https://docs.google.com/spreadsheets/d/1ioa07uZc3p1_mYloL2Q9qOKUoB0xMRf0FazWk7S8x7w)
- [Баллы по MTA](https://docs.google.com/spreadsheets/u/0/d/1fgorOF58GTGqqGotcrEy-ApDqolgkyYoZhGi8Lgad_0/htmlview?pli=1#gid=0)
- [Баллы по LAG](https://docs.google.com/spreadsheets/d/1diG6kbAqrQydG8pr27GNW5KFmlqpW0o81D3Os74mpd4/edit?gid=0#gid=0)
- [Yonote ASD](https://dm-aisd.yonote.ru/share/itmo_dm_aisd)
- [Overleaf MTA](https://www.overleaf.com/read/yvghqskxpjzb#f94883)
- [Github SDT](https://github.com/RuslanKoynov/SDT_practice)
- [Github DMT](https://github.com/Lipen/discrete-math-course?tab=readme-ov-file)
- [Форма отчетов SDT](https://docs.google.com/forms/d/e/1FAIpQLSe4ARJjnWr00JMYkp8YmZE1868FizsS-vqggzz0nSjk0ydyxQ/viewform)
- [Cloud MTA+LAG(от Бакеевой)](https://cloud.mail.ru/public/enTY/4HcyZiM5E)
---
# Правила работы с репозиторием.
- коммитить в **master** ветку запрещено, все изменения только через pull request
- весь нейминг на английском, но содержание на русском
- для каждого нового конспекта создается новая ветка (это буквально исходит из первого пункта)

# Нейминг 
## Commits
`[<subject>][<number_of_lecture>]: <action> <description>`
### Subjects:
- (fop) основы программирования -> fundamentals of programming -> fop
- (sdt) инструментальные средства разработки ПО -> Software development tools -> sdt
- (ads) алгоритмы и структуры данных -> algorithms and data structures -> ads
- (dmt) дискретная математика -> discrete math -> dmt
- (mta) математический анализ -> mathematical analysis -> mta
- (lag) линейная алгебра -> linear algebra -> lag
### Actions:
- add
- fix
- remove

Пример:
- `[sdt][05]: add lecture note`
- `[lag][xx]: add homework`
- `[ads][05]: fix incorrect algorithm`

!Если номера занятия нет, к примеру, коммит добавляет какой-то общий файл, к примеру домашку к предмету, вместо номера
указываем `xx`!

В описании нужно добавить тему пары, ее тип.
## Branches
`<subject>/<number_of_lecture>`

Пример:
- `std/01`
- `dmt/08`

## Pull requests
`[<subject>][<number_of_lecture>]`
(В описании по пунктам внесенные изменения)

# Структура проекта
```
<subject>:
    _homeworks:
        <number_of_homework>-<title>-<cnt_of_scores>-<deadline>
    <number_of_lecture><type[l(ecture)/p(ractice)]>-<title>:
        lecture.md
        smth.cpp
        
```
