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
