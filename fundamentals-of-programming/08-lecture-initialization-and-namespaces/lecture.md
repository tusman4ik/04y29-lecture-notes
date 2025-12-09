н

---


Единообразная инициализация C++11 не является абсолютно единообразной, но это почти так.

# Инициализация

Круглые скобки без ничего при инициализации — грустно тк объявление функции

```cpp
int l();
std::cout << l << '\n';
```

Начиная с 11 стандарта:
```cpp
int l{};
std::cout << l << '\n';
```


- Default initialization (простые типы)
- Value initialization 
- Direct initialization
- Copy initialization
- List initialization (структуры или классы)
- Aggregate initialization

#TODO cppreference

# Пространства имён
 
Неймспейс ОРТОГОНАЛЬНЫЙ файл то есть он может быть разбит на файлы

- Предотвращают конфликт имен
- Могут состоять из нескольких блоков
- Упрощают "читабельность" кода
- Unnamed namespace
- Namespace alias

Неймспейс --- логический блок, позволяющий объединить большое количество кода ортогонально чето там

```cpp
namespace Foo {
	void f() {
		std::cout << "Foo" << '\n';
	}
}

namespace Boo {
	void f() {
		std::cout << "Boo" << '\n';
	}
}

int main() {
	Foo::f();
	Boo::f();
}
```

```cpp
using namespace Foo;

int main() {
	f();
	Boo::f();
}
```

Неймспейс является не только логическим способом организации кодовой базы и предотвращения конфликта имён, но и несет информацию про то, откуда эта функция вызывается (про читабельность кода)

```cpp
using namespace Foo;
using namespace Boo;

int main() {
	f(); // call is ambigious
}
```

Юзинг неймспейс нельзя, но можно (но не рекомендуется):

```cpp
int main() {
	using namespace Foo;
	f();
}
```

Вложенные неймспейсы

```cpp
namespace Foo {
	namespace SomeLongNamespaceName {
		void f() {
			std::cout << "Foo" << '\n';
		}
	}
}

int main() {
	Foo::SomeLongNamespaceName::f();
}
```

Алиасы (когда не хочется длинный неймспейс):

```cpp
int main() {
	namespace SN = Foo::SomeLongNamespaceName;
	SN::f();
}
```

Анонимные неймспейсы:

```cpp
namespace {
	void f() {
		std::cout << "Unnamed namespace function\n";
	}
}

int main() {
	f();
}
```

---

