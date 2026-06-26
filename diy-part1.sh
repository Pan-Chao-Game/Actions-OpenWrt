#!/bin/bash
./scripts/feeds update -a
./scripts/feeds install -a

git clone https://github.com/vernesong/OpenClash package/luci-app-openclash
git clone https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone https://github.com/lisaac/luci-app-dockerman package/luci-app-dockerman