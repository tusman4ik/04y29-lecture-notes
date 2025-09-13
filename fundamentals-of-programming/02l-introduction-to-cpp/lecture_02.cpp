// Идентификаторы -- буквы, цифры и "_"
// Первый символ -- буква или "_"
// Case-sensitive
// Идентификатор не должен совпадать с ключевым словом

// Codestyle: Венгерская нотация, camelCase, snake_case, PascalCase
// https://google.github.io/styleguide/cppguide.html

// Встроенные типы данных:
// char -- символьный
// Целочисленные: int, short, long
// С плавающей точкой: float, double
// bool
// void
// nullptr_t

#include <iostream>
#include <limits>
#include <cstdint>

int main() {
    {
        // numeric_limits -- встроенная библиотека для проверки предельных значений типа
        std::cout << "Max value: " << std::numeric_limits<long>().max() << '\n';
        std::cout << "Min value: " << std::numeric_limits<double>().min() << '\n';
        std::cout << "Is signed value: " << std::numeric_limits<int>().is_signed << '\n';
    }

    { 
        // cstdint -- предопределенные типы с фиксированной длиной
        // int8_t, int16_t, int32_t, int64_t
        // uint8_t, uint16_t, uint32_t, uint64_t
    }

    {
        int a = 162;
        int b = 0242; // целочисленный литерал 0 -- восьмеричная система
        int c = 0xA2; // литерал 0х -- шестнадцатеричная
        int d = 0b010100010; // литерал 0b -- двоичная
        std::cout << "a = " << a << '\n'
                << "b = " << b << '\n'
                << "c = " << c << '\n'
                << "d = " << d << '\n';
    }

    {
        // по умолчанию вещественное число типа double
        double a = 0.15;
        float b = 0.15f; // вещественный литерал float
        long double c = 15e-2l; // экспоненциальная форма записи + литерал long double
        float d = 15e-2f; // экспоненциальная форма записи + литерал float
    }

    {
        char a = 'x'; // х -- символьный литерал
        // '\n' -- симпвол новой строки
        // '\t' -- горизонтальная табуляция
        // '\\' -- бэкслеш
        // '\'' -- кавычка
        std::cout << '\'\n';

        std::string s = "Hello, World!"; // строковый литерал
        // строка - массив символов
        // спец сивол конца строки '\0'
    }

    {
        // int monday = 1;
        // int sunday = 7;
        // int dayOfWeek = 5;
        // проблема 1) неоднозначность концепции
        // проблема 2) отсутствие явных ограничений и контроля корректности
        // Решение -- перечисляемый тип enum:

        enum EDayOfWeek {
            MONDAY,
            SUNDAY,
        };

        EDayOfWeek dayOfWeek = MONDAY; // однозначно трактуется и имеет четкие ограничения
    }

    {
        // Объявление (declaration)
        int a;
        float b;
        char c; 

        // Определение (definition)
        int a = 0;
        float b = 0.15f;
    }

    {
        // Преобразования типов: неявные (делает сам язык) и явные (c-style cast): (тип) <переменная>
    }

    {
        int x;
        printf("sizeof(int) - %zu\n", sizeof(int));
    }

    {
        // издевательство над условиями
        
        int n = -2, a = 1, b = 2, z = 20;

        if (n > 0)
            if (a > b)
                z = a;
        else
            z = b;
        // z == 20

        if (n > 0)
            if (a > b)
                z = a;
            else
               z = b;
        // z == 20

        if (n > 0)
            if (a > b)
                z = a;
else
                                 z = b;
        // z == 20

        if (n > 0) {
            if (a > b) {
                z = a;
            }
            else {
                z = b;
            }
        }
        // z == 20

        if (n > 0) {
            if (a > b) {
                z = a;
            }
        } else {
            z = b;
        }
        // z == 2
    }
    
    return 0;
}