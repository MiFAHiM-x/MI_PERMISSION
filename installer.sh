
#!/data/data/com.termux/files/usr/bin/bash

set -e

echo "Installing MI_PERMISSION..."

pkg install git python tmux -y

mkdir -p ~/storage/shared/script
cd ~/storage/shared/script

if [ ! -d "MI_PERMISSION" ]; then
    git clone https://github.com/MiFAHiM-x/MI_PERMISSION.git
fi

python -m pip install requests ntplib pytz urllib3 icmplib colorama

ALIAS_LINE="alias apply='tmux kill-server 2>/dev/null; bash /storage/emulated/0/script/MI_PERMISSION/start_4.sh'"

if ! grep -Fxq "$ALIAS_LINE" ~/.bashrc 2>/dev/null; then
    echo "$ALIAS_LINE" >> ~/.bashrc
fi

source ~/.bashrc

echo ""
echo "Installation complete!"
echo "Type apply to run the tool."
