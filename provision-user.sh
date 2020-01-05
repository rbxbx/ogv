mkdir $HOME/genera
cd $HOME/genera
curl -OL https://static.loomcom.com/genera/genera
chmod a+x genera

curl -OL https://static.loomcom.com/genera/worlds/Genera-8-5-xlib-patched.vlod
curl -OL https://static.loomcom.com/genera/worlds/VLM_debugger
curl -OL https://static.loomcom.com/genera/worlds/dot.VLM
mv dot.VLM .VLM
sudo sed -i '/genera.worldSearchPath:/c\genera.worldSearchPath: /home/vagrant/genera' .VLM

cd /var/lib
sudo curl -OL https://static.loomcom.com/genera/var_lib_symbolics.tar.gz
sudo tar xvf var_lib_symbolics.tar.gz
sudo chown -R $(id -u):$(id -g) symbolics
