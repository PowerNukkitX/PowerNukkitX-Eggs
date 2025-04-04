wget -O powernukkitx-shaded.jar -o /dev/null https://github.com/PowerNukkitX/PowerNukkitX/releases/download/snapshot/powernukkitx-shaded.jar
java -Dfile.encoding=UTF-8 -Djansi.passthrough=true -Dterminal.ansi=true -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:+UseStringDeduplication -XX:+EnableJVMCI -XX:MaxRAMPercentage=95.0 -jar powernukkitx-shaded.jar
