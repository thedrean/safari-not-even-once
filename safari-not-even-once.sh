#!/bin/bash
echo '  
                 _____                .__ 
  ___________  _/ ____\_____  _______ |__|
 /  ___/\__  \ \   __\ \__  \ \_  __ \|  |
 \___ \  / __ \_|  |    / __ \_|  | \/|  |
/____  >(____  /|__|   (____  /|__|   |__|
  ___\/   ___\/_/  |_       \/            
 /    \  /  _ \\   __\                    
|   |  \(  <_> )|  |                      
|___|  / \____/ |__|                      
  ___\/___  __  ____    ____              
_/ __ \\  \/ /_/ __ \  /    \             
\  ___/ \   / \  ___/ |   |  \            
 \___  > \_/   \___  >|___|  /            
  ___\/   ____    _\/_   __\/             
 /  _ \  /    \ _/ ___\_/ __ \            
(  <_> )|   |  \\  \___\  ___/            
 \____/ |___|  / \___  >\___  >           
             \/      \/     \/ 
'
which -s brew
if [[ $? != 0 ]]; then
	#install homebrew
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	brew update
fi
#check if you have brew-cask
if ! brew info brew-cask &>/dev/null; then
	#install brew-cask
	brew tap caskroom/cask
fi
#install chrome and avoid safari forever
if [ -x ~/Applications/Google\ Chrome.app ]; then 
	echo 'cask is installed already'; 
else
	brew cask install google-chrome
fi
#open and enjoy
open -a ~/Applications/Google\ Chrome.app 'http://www.google.com'
