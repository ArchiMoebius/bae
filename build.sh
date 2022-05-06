#!/usr/bin/env bash

echo '#!/usr/bin/env bash' > agent.sh

cat config.sh process.sh callback.sh checkin.sh entry.sh >> agent.sh

chmod +x agent.sh