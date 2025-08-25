 How to Install Podman via Podman Desktop on Ubuntu 24.04 (WSL Compatible)
This guide walks through installing Podman using the Podman Desktop GUI bundle. It includes steps for resolving dependencies and integrating with Docker Desktop’s Kubernetes context.

📦 Step 1: Download Podman Desktop
Download the latest release from GitHub:
wget https://github.com/podman-desktop/podman-desktop/releases/download/v1.20.2/podman-desktop-1.20.2.tar.gz -O podman-desktop.tar.gz

Extract the archive:
tar -xvzf podman-desktop.tar.gz
cd podman-desktop-1.20.2
chmod +x podman-desktop

🔧 Step 2: Install Required Libraries
Podman Desktop depends on several shared libraries. Install them with:
sudo apt update
sudo apt install libnspr4 libnss3 libxss1 libgtk-3-0 libasound2t64 policykit-1 -y

⚙️ Step 3: Install PolicyKit (Optional)
Podman Desktop may prompt to install PolicyKit. If you see a PolicyKit error, install PolicyKit:
sudo apt install policykit-1

Then retry the install from the Podman Desktop GUI.

🚀 Step 4: Launch Podman Desktop
Run the AppImage directly:
cd podman-desktop-1.20.2
./podman-desktop

🧾 Optional: Forensic Logging (Course Project Tip)
mkdir -p ~/install_logs
sha256sum podman-desktop.tar.gz >> ~/install_logs/podman-desktop.hash
echo "$(date) Installed Podman Desktop v1.20.2 and resolved dependencies" >> ~/install_logs/install.log

✅ Final Check
Verify Podman CLI is working:
podman --version

Verify Kubernetes context:
kubectl config use-context docker-desktop
kubectl get pods

