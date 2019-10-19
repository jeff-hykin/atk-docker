require 'atk_toolbox'

if OS.is?("mac")
    -"brew cask install docker"
    # open the docker app so the process starts
    -"open -a Docker"
elsif OS.is?("linux")
    if OS.is?("debian")
        -"yes | sudo apt-get remove docker docker-engine docker.io"
        # in order to get docker compose, pip is needed
        -"yes | sudo apt install docker.io python3-pip"
        # get the docker dameon running
        -"sudo systemctl start docker"
        -"sudo systemctl enable docker"
        # install docker-compose
        -"sudo pip3 install docker-compose"
    else
        puts "\n\nCurrently only Ubuntu/Debian is supported,\nIf you find/know the commands for installing this on your OS, please create a issue on github so it can be automated for everyone.\n\nSince you're on linux, the command should be pretty straightforward"
    end
else
    puts <<-HEREDOC.remove_indent
        
        
        Ah... so I see you're trying to install Docker for Windows
        I'm sorry to say that this is likely not going to be an easy task.
            
            Your best bet is finding an up-to-date (within the last 6 months) tutorial
            and then following it step by step
            
            If you have a normal Windows install (not Windows Pro, Enterprise, or Education)
            then you're going to have an extra bad time. Whatever version of Docker
            you manage to get installed, it will likely be outdated.
            
            Note that as of Summer 2019;
            there is no way to run both VirtualBox and Docker for any version of Windows,
            which can be a real problem. People have been working to solve this,
            but it has not been solved yet as far as I know.
        
        If this process has changed, and it has suddenly become possible, please 
        open an issue on github so I can update this and have it automated.
    HEREDOC
end