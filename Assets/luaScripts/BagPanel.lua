require("ItemGrid")

 require("EventSystem")

BasePanel:subClass("BagPanel")
BagPanel.PanelObject=nil
BagPanel.isInit=false
BagPanel.content=nil
BagPanel.MatBtn=nil
BagPanel.HemBtn=nil
BagPanel.items={}
function BagPanel:Init(panelName)
    
    if self.PanelObject==nil then
       self.base.Init(self,panelName);
      
      self.content=self:GetCom("scrollBag","ScrollRect").transform:Find("Viewport/Content"):GetComponent(typeof(Transform))
      self.MatBtn=self:GetCom("MaterialBtn","Button")
      self.HemBtn=self:GetCom("HelmetBtn","Button")
      print(111)
      self.MatBtn.onClick:AddListener(function ()
       self:Open("Material")
       
      end)
    self.HemBtn.onClick:AddListener(function ()      
        self:Open("Helmet")
      end)
      
    end
    if self.isInit==false then
        self.isInit=true
    end
end
function  BagPanel:Open(name)
 
    for i = 1, #self.items do
        self.items[i]:Destroy()
    end
       self.items = {}
    if name=="Material" then
        curItems = PlayerData.Material

        Bagname="Material_1"
    elseif name=="Helmet" then
        curItems = PlayerData.Helmet
        
        Bagname="Helmet_1"
    end
    if curItems ~= nil then
       
            for i = 1, #curItems do
                --根据数据,创建格子对象
             
                local grid = ItemGrid:new()
                --实例化对象,设置位置
                grid:Init(self.content)
                --初始化它的信息 设置图标和数量
                grid:InitData(curItems[i],name,Bagname)
    
                table.insert(self.items,grid)
            end
    end   


end
