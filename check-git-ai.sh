#!/bin/bash
# SPDX-FileCopyrightText: 2026 Lorenz Sieben <sieben@gea.mpg.de>
# SPDX-License-Identifier: GPL-3.0-or-later

REVISION_SPEC=${1:-HEAD}

EXIT_CODE=0
for commit in $(git log --pretty=tformat:"%H" $REVISION_SPEC)
do
    git notes --ref refs/notes/ai list $commit > /dev/null
    if [[ "$?" != "0" ]]
    then
        EXIT_CODE=1
    fi
done

exit $EXIT_CODE