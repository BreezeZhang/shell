echo "<string name="apk_update_title">UPDATE</string>" | awk -F "[<>]" '{print $3}'
echo "<string name="apk_update_title">UPDATE</string>" | sed -r 's/.*>(.*)<.*/\1/'
echo "<string name="apk_update_title">UPDATE</string>" | grep -oP "(?<=>)[A-Z]+"  
awk '{log[$0]++;if (log[$0]<2) print}' email_file