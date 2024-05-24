%%Tiempos entre arribos de belport
%%BCpAug89.TL
datos = load('BCpAug89.TL');
tea = diff(datos(:,1));
vt(tea);
%% 
%%BCpOct89.TL
datos = load('BCpOct89.TL');
tea = diff(datos(:,1));
vt(tea);
%% 
%%BCOct89Ext.TL
datos = load('BCOct89Ext.TL');
tea = diff(datos(:,1));
vt(tea);
%% %% 
%%BCOct89Ext4.TL
datos = load('BCOct89Ext4.TL');
tea = diff(datos(:,1));
vt(tea);
%% 
%%Tamaño de los paquetes de archivo de belport
%%BCpAug89.TL
datos = load('BCpAug89.TL');
paquetes = datos(:,2);
vt(paquetes);
%% %% 
%%Tamaño de los paquetes de archivo de belport
%%BCpOct89.TL
datos = load('BCpOct89.TL');
paquetes = datos(:,2);
vt(paquetes);
%% %% %% 
%%Tamaño de los paquetes de archivo de belport
%%BCOct89Ext.TL
datos = load('BCOct89Ext.TL');
paquetes = datos(:,2);
vt(paquetes);
%% 
%%Tamaño de los paquetes de archivo de belport
%%BCOct89Ext4.TL
datos = load('BCOct89Ext4.TL');
paquetes = datos(:,2);
vt(paquetes);