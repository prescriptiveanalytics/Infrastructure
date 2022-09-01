# Proxmox Cluster Setup

## Host Setup
  * install Proxmox VE from ISO image

  * update packages and install multipath-tools
    ```shell
    apt update
    apt install multipath-tools
    ```

  * create ```/etc/multipath.conf```
    ```
    blacklist {
        wwid .*
    }

    blacklist_exceptions {
        wwid "3600c0ff00066876d7844066301000000"
    }

    defaults {
        find_multipaths        yes
        user_friendly_names    yes
    }


    devices {
        device {
            vendor                  "DellEMC"
            product                 "ME4"
            path_checker            "tur"
            uid_attribute           "ID_SERIAL"
            hardware_handler        "1 alua"
            prio                    "alua"
            failback                immediate
            rr_weight               "uniform"
            path_selector           "round-robin 0"
            path_grouping_policy    multibus
        }
    }

    multipaths {
        multipath  {
            wwid "3600c0ff00066876d7844066301000000"
            alias DELLM4024SAN
        }
    }
    ```

  * change ```/etc/lvm/lvm.conf```
    ```
    ...
    scan = [ "/dev", "/dev/mapper" ]
    ...
    filter = [ "a|/dev/mapper/|", "a|/dev/sda.*|", "r|.*|" ]
    ...
    ```

  * change ```/etc/ssh/sshd_config```
    ```
    ...
    PermitRootLogin prohibit-password
    ...
    ```

  * reboot

  * configuration steps in Proxmox GUI
    * join host to existing Proxmox cluster
    * change repositories
      * add ```pve-no-subscription```
      * disable ```pve-enterprise```
    * install updates
