#!/bin/bash
bat=`acpi -b`
discharging=`acpi | grep "Discharging"`
low=`grep "low" /home/miyako/.config/i3/energymodifier`
normal=`grep "normal" /home/miyako/.config/i3/energymodifier`
critical=`grep "critical" /home/miyako/.config/i3/energymodifier`
#!/bin/bash

if [[ $discharging ]]; then
    # do checks
    # echo "discharging"
    if [[ `echo $bat | grep Discharging` && `echo $bat | cut -f 5 -d " "` < 00:15:00 ]]; then
        # crictically low
        # echo "critical"
        if ! [[ $critical ]] ; then 
            # echo "copy"
            # copy
            void=`cp /home/miyako/.config/i3/criticalenergymodifier /home/miyako/.config/i3/energymodifier`
            void=`i3-msg reload`
        fi
        sleep 1s
    elif [[ `echo $bat | grep Discharging` && `echo $bat | cut -f 5 -d " "` < 01:00:00 ]]; then
        # low
        # echo "low"
        if ! [[ $low ]] ; then 
            # copy
            # echo "copy"
            void=`cp /home/miyako/.config/i3/lowenergymodifier /home/miyako/.config/i3/energymodifier`
            void=`i3-msg reload`
        fi
        sleep 30s
    else 
        # normal 
        # echo "normal"
        if ! [[ $normal ]] ; then 
            # copy
            # echo "copy"
            void=`cp /home/miyako/.config/i3/normalenergymodifier /home/miyako/.config/i3/energymodifier`
            void=`i3-msg reload`
        fi
        sleep 5m
    fi

else
    # echo "charging"
    if ! [[ $normal ]] ; then
        # echo "copy"
        void=`cp /home/miyako/.config/i3/normalenergymodifier /home/miyako/.config/i3/energymodifier`
        void=`i3-msg reload`
    fi
    sleep 5m
    # sleep
fi
