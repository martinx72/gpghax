# gpghax

>Disclaimer: this can brick your console. Don't use if you don't understand every piece of how it works.

This uses lolhack, a payload launcher created by madmonkey.

What if PlayStation Classic, but with a game library that's actually fun to play?

# 1. Adding Custom Games:

* for Japanese PSC console, please rename games/custom.jpn.db file to games/custom.db
* for U.S. PSC console, please rename games/custom.us.db to games/custom.db


Open games/custom.db in an SQLite Editor of your choice.
Add new entry to the GAME table as follows:
* GAME_ID = numerical identifier, has to be unique
* GAME_TITLE_STRING = Name of the game
* PUBLISHER_NAME = self explanatory
* RELEASE_YEAR = self explanatory
* PLAYERS = number of players
* RATING_IMAGE = Has to be CERO_A
* GAME_MANUAL_QR_IMAGE = Has to be QR_Code_GM
* LINK_GAME_ID = leave empty

Then you have to add the actual disc files to the DB.
Open DISC table and add new entry per each disc for the game:
* GAME_ID = GAME_ID from the GAME table
* DISC_NUMBER = disc number
* BASENAME = base name for the cue/bin file pair, i.e: SCUS-94426

Save that file.

Then you have to add actual game files, go to games dir and create a new folder with the GAME_ID from previous steps, i.e 21.
Inside of that directory you need to put at least those files:
* BASENAME.cue (use the BASENAME value from the DISC table, i.e SCUS-94426.cue)
* BASENAME.bin (use the BASENAME value from the DISC table, i.e SCUS-94426.bin)
* BASENAME.png (use the BASENAME value from the DISC table, i.e SCUS-94426.png)
* pcsx.cfg (use the default one from the sample game with id 21)

# Running:
Put everything onto an empty USB drive named SONY, plug the usb drive into the port 2 and reboot the system. If everything worked fine, you should see your custom game in the menu.

# NOTES:
If you add a game, navigate to it in the menu, close the console, and then remove said game, upon next boot the console will fail to start. You need to make sure to always shutdown the system with one of the stock games selected.

If you don't want to/don't know how to edit the database file, you can just replace the empty SCUS-94426.cue and SCUS-94426.bin files from this repo with your game (just make sure you keep the same name for the files) and it should work somewhat fine.

Pressing select+^ simultaneously after executing of the game, would bring out the PCSX setting menu. (by MarTinX)

# Credits:
madmonkey, DanTheMan827, skogaby

----- 我是分隔線 ----- 
</br></br>
# gpghax - 日文主機的安裝說明 by MarTinX
> 免則聲明: 以下的操作，可能會導致你的主機變磚，如果你不清楚了解他如何正確運作請勿使用本工具！
</br></br>
#如何操作:
1. 準備一個隨身碟, 並將他格式化為 FAT32 的格式，將其磁碟機標籤設定為 SONY (沒有空白，且必須全部都大寫)。
2. 將本專案的所有檔案拷貝進入隨身碟，拷貝完成後之隨身碟內根目錄資料結構應該為三個子目錄跟一個README.md(本檔案)。
3. 如果即將操作的主機是日規主機，請將隨身碟中 games 子目錄內的 custom.jpn.db 改名為 custom.db。</br>
若為美規主機則將 custom.us.db 改名為 custom.db。</br>
``` diff 
+注意!此步驟3若沒有正確執行，則整個想要的追加遊戲功能將會完全無效。
```
4. 緊接著就是準備要加入系統的遊戲光碟映像檔（其檔案格式必須是cue/bin)，在將其映像檔拷貝進入隨身碟之前，請先將檔案名稱改為 SCUS-94426.bin 與 SCUS-94426.cue （請注意，在此檔案名稱大小寫必須完全相符，如不相符，則會操作失敗)。且在這個新的 SCUS-94426.cue 文字檔內的 bin 檔案名稱也必須指向為 SCUS-94426.bin（大小寫必須完全相符)。
5. 把步驟4內準備好的兩個檔案，複製放到隨身碟中的 \games\21 目錄內。(原本目錄內會有空的檔案，直接覆蓋掉即可)
6. 接著是要把遊戲於主機上的封面圖示準備好。遊戲封面檔案為512x512的PNG格式，將其準備好後，把檔案命名為 SCUS-94426.png (檔案名稱大小寫必需完全相符)，並將檔案拷貝至隨身碟中的 \games\21 目錄內。(原本目錄內會有空的檔案，直接覆蓋掉即可)
7. 以上步驟確實完成後，存放額外遊戲的隨身碟已經準備完成。
8. 按下主機上的 Power 按鈕將其關機，並確認主機的電源指示燈變為橘色燈色後，把隨身碟插上主機2P的手把 USB 插口上。
9. 隨身碟插上後，將主機的電源線 (Micro USB線) 拔掉，十秒鐘後，在將電源線插上，且<b>務必等候主機的電源指示燈變換為橘色燈色後</b>，方能按下 Power 按鈕將其開機。
10. 如果一切順利，開機後就會看到這款追加的遊戲出現在主機的畫面中了！ Happy Hacking.
</br></br></br>


如果要把系統復原，只需要在步驟3把 \games\regional.jpn.ori.db(日規) 或是 \games\regional.us.ori.db(美規) 改名為 \games\custom.db 接著執行步驟8步驟, 即可恢復。
</br></br>

如何追加第22, 第23等甚至到第25個遊戲的方法，上方的英文教學有寫到，須透過編輯軟體將 custom.db 內之資料庫檔案修改，對一般使用者來說算是稍微複雜了點，屬於較為進階的操作，請務必詳讀英文說明再自行操作！</br>
</br>
</br>
此外，<b>如果需要把主畫面的檔案擴充超過25個</b>（原生的系統限制為25個，超過則會異常）</br>
僅需於上述的步驟3內，把 \games\sonyapp-copylink.50 改名為 \games\sonyapp-copylink，上限即可增加至50個。</br>
若50個還是不夠用，請把\games\sonyapp-copylink.100 改名為 \games\sonyapp-copylink，上限即可增加至100個。</br>
</br>
</br>
# Note:
小編不只幫原作者追加了日文主機的支援，還追加了可以使用手把即可開啟神秘的 PCSX 設定選單的功能。</br>
進入遊戲之後，可透過同時按壓手把上的 Select + ^ 兩個按鈕開啟選單。再也不用找特殊鍵盤而傷腦筋了！</br>
</br></br>
電玩怪盜團FB: https://www.facebook.com/groups/GameKaito/</br>
</br>
成果展示: https://youtu.be/IdyZpvv_jYQ

