Object:subClass("ItemGrid")
local EventSystem = require("EventSystem")
ItemGrid.object = nil
ItemGrid.imgIcon = nil
ItemGrid.txtNum = nil
function ItemGrid:Init(Aparent)
    self.object = ABMgr:loadres("uiprefab", "BagItem", typeof(GameObject))
    
    --设置父对象
 
    self.object.transform:SetParent(Aparent,false)
   
    --找控件
    self.imgIcon = self.object.transform:Find("Image"):GetComponent(typeof(Image))
    self.txtNum = self.object.transform:Find("Text"):GetComponent(typeof(Text))
end
function ItemGrid:InitData(data,str,sprite)
    --加载图集
   
    local spriteAtlas = ABMgr:loadres("uiprefab", str, typeof(SpriteAtlas))
    --加载图标 
  
    self.imgIcon.sprite = spriteAtlas:GetSprite(sprite)
    --设置数量
    self.txtNum.text =data.num


end



---销毁自身
function ItemGrid:Destroy()
    GameObject.Destroy(self.object)
    self.object = nil
end