#!/bin/bash
builddep=".builddep/"

if [[ -d $CODEPATH$builddep$THS_TIER ]];then
        runpath=$THS_TIER
else
        runpath="default"
fi

if [[ -f $CODEPATH$builddep$runpath"/readiness.sh" ]];then
        chmod +x $CODEPATH$builddep$runpath/readiness.sh
        exec $CODEPATH$builddep$runpath/readiness.sh
fi
