# opensoc_pdk_stack
PDK stack for opensource SOC which includes sky130A/B, GF180MCUC, xschem, magic, klayout, netgen

## Steps to install PDK and tools
- download: clone the repo
```bash
git clone https://github.com/venkataratnamb20/opensoc_pdk_stack.git
```
- go to directory
```bash
cd opensoc_pdk_stack
```
- give permission and run script
```bash
chmod u+x ./*.sh && ./install_tools.sh
```

## Test installatioon
- check pdk directory
```bash
ls -al /usr/local/share/pdk
```
- chck xschem
```bash
xschem -v
```
- check magic
```bash
magic --version
```
- check klayout
```bash
klayout -v
```
- check netgen
```bash
netgen -v
```

## Launching xschem, klayout and magic with sky130A
- Create a directory for a cell and change directory
```bash
mkdir inv1x && cd inv1x
```
### Launch `xschem`
- initialize xscem in the newly created cell- a for `Sky130A` and b for `Sky130B`
```bash
xschem_inita
```
- Launch `xschem`
```bash
xschem
```

### Launch `magic`
-Initialize `magic` for skyA/B- A for Sky130A and B for Sky130B
```bash
magic_init
```
- Launch magic with `sky130A`
```bash
magicskya
```

### Klayout
```bash
klayoutskya
```

