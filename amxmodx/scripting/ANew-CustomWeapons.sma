#include <amxmodx>

enum CWAPI_GiveType{
    CWAPI_GT_SMART = -1, // Для ножей GT_REPLACE, для гранат GT_APPEND, для остального GT_DROP_AND_REPLACE
    CWAPI_GT_APPEND, // Аналог GT_APPEND
    CWAPI_GT_REPLACE, // Аналог GT_REPLACE
    CWAPI_GT_DROP, // Аналог GT_DROP_AND_REPLACE
}

/**
 * Выдаёт кастомное оружие игроку
 *
 * @param UserId      Идентификатор игрока, которому надо выдать оружие
 * @param WeaponName  Название оружия указанное в конфиге
 * @param Type        Тип выдачи (см. CWAPI_GiveType)
 *
 * @return      Идентификатор выданного предмета. -1 в случае ошибки
 */
native CWAPI_GiveWeapon(const UserId, const WeaponName[], const CWAPI_GiveType:Type = CWAPI_GT_SMART);

// Выдать оружие созданное в ultimate_weapons.ini
// Достаточно указать один из параметров, либо uid, либо buy_name. Если указать оба, то плагин примет только uid
// replace:
//	0 - оружие добавится к существующему
//	1 - выкинуть существующие
//	2 - уничтожить существующее
//	3 - не выдавать тогда оружие
// ammo и bpammo:
//	кол-во патрон в обойме и запасе соответственно. Можно не указывать, тогда выдаст то кол-во, которое указано в ultimate_weapons.ini
// Пример:
//	weapons_give_user_ultimate(id, _, "ultimate_ak47");
//	weapons_give_user_ultimate(id, 100);
native weapons_give_user_ultimate(id, uid=-1, buy_name[]="", replace=0, ammo=-1, bpammo=-1);

/**
* Give weapon by weapon name
*
* @param iPlayer					id
* @param sWeaponName				Weapon Name
* @param notification				Show chat notification's
* @param uid						Weapon UID
* @param iUidWithOffset				Is UID contain internal offset
* @param iBuy						Buy
*	
* @return							true/false
*/
native __auw__native__auw_give_weapon(iPlayer, const sWeaponName[], const bool: notification = true, const uid = -1, const iUidWithOffset = true, const iBuy = 0);

public plugin_init() {
    register_plugin("[ANew] Custom Weapons", "1.0.0", "ArKaNeMaN");
}

public plugin_natives() {
    set_native_filter("native_filter");
}

public native_filter(const name[], index, trap) {
    if (strcmp(name, "CWAPI_GiveWeapon")) {
        return PLUGIN_HANDLED;
    }
    
    if (strcmp(name, "__auw__native__auw_give_weapon")) {
        return PLUGIN_HANDLED;
    }

    if (strcmp(name, "weapons_give_user_ultimate")) {
        return PLUGIN_HANDLED;
    }

    return PLUGIN_CONTINUE;
}

public ANew_CWAPI(const UserId, const sWeaponName[]) {
    return (CWAPI_GiveWeapon(UserId, sWeaponName) > 0);
}

public ANew_AUW(const UserId, const sWeaponName[]) {
    return __auw__native__auw_give_weapon(UserId, sWeaponName);
}

public ANew_UW(const UserId, sWeaponName[]) {
    // Почему buy_name не константа?)
    return weapons_give_user_ultimate(UserId, -1, sWeaponName, 1);
}
