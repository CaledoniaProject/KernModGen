#!/bin/bash

Makefile="b2JqLW0gKz0gYWJjLm8KCmRlZmF1bHQ6IGFsbAoKY2xlYW46CgltYWtlIC1DIC9saWIvbW9kdWxl\
cy9gdW5hbWUgLXJgL2J1aWxkIFNVQkRJUlM9YHB3ZGAgY2xlYW4KCmFsbDoKCW1ha2UgLUMgL2xp\
Yi9tb2R1bGVzL2B1bmFtZSAtcmAvYnVpbGQgU1VCRElSUz1gcHdkYCBtb2R1bGVzCg=="

mod="I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgojaW5jbHVkZSA8bGludXgvcHRyYWNlLmg+CiNpbmNs\
dWRlIDxsaW51eC9rZXJuZWwuaD4KI2luY2x1ZGUgPGxpbnV4L2Vycm5vLmg+CiNpbmNsdWRlIDxs\
aW51eC9zbGFiLmg+CiNpbmNsdWRlIDxsaW51eC91c2VyLmg+CiNpbmNsdWRlIDxsaW51eC9zZWN1\
cml0eS5oPgojaW5jbHVkZSA8bGludXgvdW5pc3RkLmg+CiNpbmNsdWRlIDxsaW51eC9ub3RpZmll\
ci5oPgojaW5jbHVkZSA8bGludXgvdmVyc2lvbi5oPgoKc3RhdGljIHZvaWQgX19leGl0IGNsZWFu\
dXAodm9pZCkKewp9CgoKc3RhdGljIGludCBfX2luaXQgc3RhcnR1cCh2b2lkKQp7Cn0KCm1vZHVs\
ZV9pbml0KHN0YXJ0dXApOwptb2R1bGVfZXhpdChjbGVhbnVwKTsKCk1PRFVMRV9MSUNFTlNFKCJH\
UEwiKTsKTU9EVUxFX0FVVEhPUigiU29tZW9uZSBMaWtlIFlvdSIpOwoK"

[[ $# != 1 ]] && {
	echo Usage $0 module_name
	exit 1
}

MODNAME=$1

if ! [[ $MODNAME =~ ^[a-zA-Z0-9]+$ ]];then
	echo "E: module name should be alpha number only"
	exit 1
fi

if [[ -d $MODNAME ]];then
	read -p "Folder $MODNAME already exists, overwrite it? [N|Y]" YES
	if [[ "${YES}" =~ [y|Y] ]];then
		rm -rf $MODNAME
	else
		exit 2
	fi
fi

mkdir -p $MODNAME

echo $Makefile | base64 -d | sed "s/obj-m.*$/obj-m += $MODNAME.o/" > $MODNAME/Makefile
echo $mod | base64 -d > $MODNAME/$MODNAME.c

