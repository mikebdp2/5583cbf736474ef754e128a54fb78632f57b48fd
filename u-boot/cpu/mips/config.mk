#
# (C) Copyright 2003
# Wolfgang Denk, DENX Software Engineering, <wd@denx.de>
#
# See file CREDITS for list of people who contributed to this
# project.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2 of
# the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston,
# MA 02111-1307 USA
#
# MIPSFLAGS -> #MIPSFLAGS - cu570m
v=$(shell $(AS) --version |grep "GNU assembler" |cut -d. -f2)
#MIPSFLAGS:=$(shell \
if [ "$v" -lt "14" ]; then \
	echo "-mcpu=4kc"; \
else \
	echo "-march=4kc -mtune=4kc"; \
fi)

ifneq (,$(findstring 4KCle,$(CROSS_COMPILE)))
ENDIANNESS = -EL
#else # cu570m
#ENDIANNESS = -EB
endif

# cu570m
### R3B0RN $(R3B0RN_UBOOT_EXTRA_MIPSFLAGS) ###
# MIPSFLAGS += $(ENDIANNESS)
MIPSFLAGS += $(ENDIANNESS) -march=mips32r2 $(R3B0RN_UBOOT_EXTRA_MIPSFLAGS)

PLATFORM_CPPFLAGS += $(MIPSFLAGS)
