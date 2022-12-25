
require("Object")
Object:subClass("BasePanel")
BasePanel.PanelObject=nil;
BasePanel.isInit=false;
BasePanel.components = {}
function BasePanel:Init(panelName)
    if self.PanelObject==nil then
        self.PanelObject=ABMgr:loadres("uiprefab",panelName,typeof(GameObject));
        self.PanelObject.transform:SetParent(RootCanvas)
    end
    --存储ui组件
    local allComponents=self.PanelObject:GetComponentsInChildren(typeof(UIBehaviour))
    for i=0,allComponents.Length-1 do
        local compName=allComponents[i].name
        if string.find(compName,"Btn") ~= nil or
        string.find(compName,"scroll") ~= nil then
            local typeName=allComponents[i]:GetType().Name;
          
            if self.components[compName] ~= nil then
                
                self.components[compName][typeName] = allComponents[i]       
            else
               
                self.components[compName] = {[typeName] = allComponents[i]}
            end
        end

    end
   
end
function BasePanel:GetCom(name,typeName)
    
    if self.components[name] ~= nil then
       
        local targetComps = self.components[name]
        if targetComps[typeName] ~= nil then
           
            return targetComps[typeName]
            
        end
    end
    return nil
    
end
function BasePanel:Show(panelName)
   
    self:Init(panelName)
    self.PanelObject:SetActive(true);
    
end
function BasePanel:Hide()
    self.PanelObject:SetActive(false)
end