#!/bin/sh

###############
# GLOBAL VAR SECTION
CERT="-----BEGIN CERTIFICATE-----\n
MIIDwzCCAqugAwIBAgIBATANBgkqhkiG9w0BAQsFADCBgjELMAkGA1UEBhMCREUx\n
KzApBgNVBAoMIlQtU3lzdGVtcyBFbnRlcnByaXNlIFNlcnZpY2VzIEdtYkgxHzAd\n
BgNVBAsMFlQtU3lzdGVtcyBUcnVzdCBDZW50ZXIxJTAjBgNVBAMMHFQtVGVsZVNl\n
YyBHbG9iYWxSb290IENsYXNzIDIwHhcNMDgxMDAxMTA0MDE0WhcNMzMxMDAxMjM1\n
OTU5WjCBgjELMAkGA1UEBhMCREUxKzApBgNVBAoMIlQtU3lzdGVtcyBFbnRlcnBy\n
aXNlIFNlcnZpY2VzIEdtYkgxHzAdBgNVBAsMFlQtU3lzdGVtcyBUcnVzdCBDZW50\n
ZXIxJTAjBgNVBAMMHFQtVGVsZVNlYyBHbG9iYWxSb290IENsYXNzIDIwggEiMA0G\n
CSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCqX9obX+hzkeXaXPSi5kfl82hVYAUd\n
AqSzm1nzHoqvNK38DcLZSBnuaY/JIPwhqgcZ7bBcrGXHX+0CfHt8LRvWurmAwhiC\n
FoT6ZrAIxlQjgeTNuUk/9k9uN0goOA/FvudocP05l03Sx5iRUKrERLMjfTlH6VJi\n
1hKTXrcxlkIF+3anHqP1wvzpesVsqXFP6st4vGCvx9702cu+fjOlbpSD8DT6Iavq\n
jnKgP6TeMFvvhk1qlVtDRKgQFRzlAVfFmPHmBiiRqiDFt1MmUUOyCxGVWOHAD3bZ\n
wI18gfNycJ5v/hqO2V81xrJvNHy+SE/iWjnX2J14np+GPgNeGYtEotXHAgMBAAGj\n
QjBAMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgEGMB0GA1UdDgQWBBS/\n
WSA2AHmgoCJrjNXyYdK4LMuCSjANBgkqhkiG9w0BAQsFAAOCAQEAMQOiYQsfdOhy\n
NsZt+U2e+iKo4YFWz827n+qrkRk4r6p8FU3ztqONpfSO9kSpp+ghla0+AGIWiPAC\n
uvxhI+YzmzB6azZie60EI4RYZeLbK4rnJVM3YlNfvNoBYimipidx5joifsFvHZVw\n
IEoHNN/q/xWA5brXethbdXwFeilHfkCoMRN3zUA7tFFHei4R40cR3p1m0IvVVGb6\n
g1XqfMIpiRvpb7PO4gWEyS8+eIVibslfwXhjdFjASBgMmTnrpMwatXlajRWc2BQN\n
9noHV8cigwUtPJslJj0Ys6lDfMjIq2SPDqO/nBudMNva0Bkuqjzx+zOAduTNrRlP\n
BSeOE6Fuwg==\n
-----END CERTIFICATE-----"
CERT_URL="https://www.pki.dfn.de/fileadmin/PKI/zertifikate/T-TeleSec_GlobalRoot_Class_2.pem"
CERT_DIR="/usr/cert/"
CERT_NAME="T-TeleSec_GlobalRoot_Class_2.pem"
CERT_PATH="$CERT_DIR$CERT_NAME"

WPA_CONF="# wpa_supplicant mit EAP-PEAP ##################################\n
ctrl_interface=/var/run/wpa_supplicant\n
ap_scan=0\n
network={\n
        key_mgmt=WPA-EAP\n
        eap=PEAP\n
        anonymous_identity="'"eduroam@uni-bielefeld.de"'"\n
        identity="'"EMAIL_DI_BIELEFELD"'"\n
        password="'"PASSWORD_DI_BIELEFELD"'"\n
        ca_cert="'"'$CERT_PATH'"'"\n
        phase2="'"auth=MSCHAPV2"'"\n
        priority=10\n
}"
WPA_DIR="/etc/wpasupplicant/"
WPA_NAME="wpasupplicant.conf"
WPA_PATH="$WPA_DIR$WPA_NAME"

RESTART_WPA="#!/bin/sh\n
killall wpa_supplicant\n
wpa_supplicant -D wired -i eth0 -B -c "$WPA_PATH
RESTART_WPA_DIR="/script/"
RESTART_WPA_NAME="restart_wpa .sh"
RESTART_WPA_PATH="$RESTART_WPA_DIR$RESTART_WPA_NAME"

RC="/etc/rc.local"


###############


###############
# DIRECTORY SECTION

echo "Creating working dir.."

mkdir $WPA_DIR
echo "Created $WPA_DIR"

mkdir $CERT_DIR
echo "Created $CERT_DIR"

mkdir $RESTART_WPA_DIR
echo "Created $RESTART_WPA_DIR"
###############

###############
# T-TeleSec_GlobalRoot_Class_2 CERT FILE
echo "Creating Certificate file (Valid until 1. Oktober 2033, 23:59:59 GMT).."

if [ ! -e $CERT_PATH ]; then
    echo -e $CERT > $CERT_PATH
  else
    echo "Deliting $CERT_NAME to recreate it"
    rm $CERT_PATH
    echo -e $CERT > $CERT_PATH
  fi
echo "Created file $CERT_NAME"

# echo "Downloading Certificate file (Valid until 1. Oktober 2033, 23:59:59 GMT).."
# wget $CERT_URL
# echo "Downloaded file $CERT_NAME"
# mv $CERT_NAME $CERT_DIR
cat $CERT_PATH

chmod 444 $CERT_PATH
echo "$CERT_NAME Now is only in read mode"

###############



###############
# WPA CONF FILE
echo "Creating WPA_CONF file"

if [ ! -e $WPA_PATH ]; then
  echo -e $WPA_CONF > $WPA_PATH
else
  echo "Deliting $WPA_NAME to recreate it"
  rm $WPA_PATH
  echo -e $WPA_CONF > $WPA_PATH
fi

echo "Created file $WPA_NAME"
chmod 400 $WPA_PATH
echo "$WPA_NAME Now is only in read mode for root"

###############



###############
# RESTART WPA FILE
echo "Creating restart wpa file"

if [ ! -e $RESTART_WPA_PATH ]; then
  echo -e $RESTART_WPA > $RESTART_WPA_PATH
else
  echo "Deliting $RESTART_WPA_NAME to recreate it"
  rm $RESTART_WPA_PATH
  echo -e $RESTART_WPA > $RESTART_WPA_PATH

fi

echo "Created file $RESTART_WPA_NAME and making it executable"
chmod 700 $RESTART_WPA_PATH

###############

###############
# Insert email  & Password SECTION

echo "Please insert your credential to modify the $WPA_NAME file to authenticate to network."
echo "Insert your email (name.surname@uni-bielfeld.de or n.surname@uni-bielfeld.de)"
read -p 'Email: ' email

echo "Insert your email (name.surname@uni-bielfeld.de or n.surname@uni-bielfeld.de)"
read -sp 'Password: ' password

sed -i "s/EMAIL_DI_BIELEFELD/$email/" $WPA_PATH
sed -i "s/PASSWORD_DI_BIELEFELD/$password/" $WPA_PATH

echo "NEW FILE IS:"
cat $WPA_PATH

###############
# rc.local section
echo "Editing rc.local and making it executable"

echo $RESTART_WPA_PATH >> $RC
chmod 700 $RC

echo "New rc.local"
cat $RC

###############

###############
# Cron section
echo "Starting & Enabling cron service"
/etc/init.d/cron start
/etc/init.d/cron enable

# $CRON_COMMAND="0 2,14 * * *  >/dev/null 2>&1"
# (crontab -l ; echo $CRON_COMMAND)| crontab -
(crontab -l ; echo "0 2,14 * * * $RESTART_WPA_PATH >/dev/null 2>&1")| crontab -
/etc/init.d/cron restart

###############



###############
# Starting wpa

wpa_supplicant -D wired -i eth0 -B -c $WPA_PATH

###############
