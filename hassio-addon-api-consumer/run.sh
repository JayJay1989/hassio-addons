#!/usr/bin/with-contenv bashio

set +e
if [ -n "$TZ" ] && [ -f /etc/localtime ]; then
    if [ -f /usr/share/zoneinfo/"$TZ" ]; then
        echo "Timezone set from $(cat /etc/timezone) to $TZ"
        ln -snf /usr/share/zoneinfo/"$TZ" /etc/localtime && echo "$TZ" >/etc/timezone
    fi
fi

cp /data/options.json .
mkdir -p /config/addons_config/api-consumer/consumers && cp -r *Consumer*.js /config/addons_config/api-consumer/consumers/

npm install
node index.js