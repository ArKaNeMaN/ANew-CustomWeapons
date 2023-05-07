# [ANew] Custom Weapons

Позволяет выдавать через бонусную систему [AES](https://dev-cs.ru/resources/362/) (/anew) пушки из:
- [Ultimate Weapons](https://fungun.net/shop/?p=show&id=82)
- [Advanced Ultimate Weapons](https://dev-cs.ru/resources/945/)
- [Custom Weapons API](https://github.com/ArKaNeMaN/amxx-CustomWeaponsAPI)

## Структура бонуса

```ini
<call>
plugin = ANew-CustomWeapons.amxx
name = <Название бонуса>
function = <Название функции>
flags = <Название пушки>
; ...остальные параметры...
```

- Где `<Название функции>` - название функции, соответствующей используемой системе кастомного оружия:
    - `ANew_CWAPI` - [Custom Weapons API](https://github.com/ArKaNeMaN/amxx-CustomWeaponsAPI)
    - `ANew_UW` - [Ultimate Weapons](https://fungun.net/shop/?p=show&id=82)
    - `ANew_AUW` - [Advanced Ultimate Weapons](https://dev-cs.ru/resources/945/)

Из-за странностей реализации AES, под название пушки был выбран параметр `flags`.

## Примеры

Примеры бонусов из разных систем кастомного оружия:

### Custom Weapons API

```ini
<call>
plugin = ANew-CustomWeapons.amxx
name = Вип-калаш
function = ANew_CWAPI
flags = Vip_AK47
points = 1
```

### Ultimate Weapons

```ini
<call>
plugin = ANew-CustomWeapons.amxx
name = Ультимативный Калаш
function = ANew_UW
flags = ultimate_ak47
points = 1
```

### Advanced Ultimate Weapons

```ini
<call>
plugin = ANew-CustomWeapons.amxx
name = Ультимативный Калаш
function = ANew_AUW
flags = ultimate_ak47
points = 1
```
