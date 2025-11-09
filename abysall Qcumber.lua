local CONFIG = {
    TRANSLATE_DELAY = 0.2,
    NOTIFICATION_DURATION = 3,
    GUI_SCAN_DELAY = 0.02,
    BATCH_PROCESS_SIZE = 50
}

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local Translations = {
    ["General"] = "主页",
    ["[Abysall Hub]"] = "[深渊·脚本]",
    ["Transparency"] = "透明度",
    ["abysall hub"] = "深渊·中国[Qcumber100]",
    ["Speed Boost"] = "加速等级",
    ["Ladder Speed"] = "梯子速度",
    ["Enable Speed Boost"] = "启用速度加成",
    ["Lockpick"] = "撬锁器",
    ["Lock"] = "锁定",
    ["Unlock"] = "已锁定",
    ["Exploits"] = "漏洞利用",
    ["Character"] = "玩家",
    ["ESP"] = "增强型感知",
    ["Visuals"] = "视觉效果",
    ["Floor"] = "楼层",
    ["Miscellaneous"] = "杂项",
    ["Configuration"] = "配置",
    ["Search"] = "搜索",
    ["Fade Time"] = "淡入淡出时间",
    ["Text Outline Transparency"] = "文字轮廓透明度",
    ["Text Size"] = "文字大小",
    ["Text Font"] = "文字字体",
    ["Custom Outline Color"] = "自定义轮廓颜色",
    ["Show Distance"] = "显示距离",
    ["Enable Tracers"] = "启用追踪线",
    ["Tracer Thickness"] = "追踪线粗细",
    ["Tracer Origin"] = "追踪线起点",
    ["Enable Arrows"] = "启用箭头",
    ["Arrow Radius"] = "箭头半径",
    ["Camera"] = "相机",
    ["Effects"] = "特效",
    ["Ambience"] = "氛围",
    ["Field Of View"] = "视野范围",
    ["Third Person"] = "第三人称",
    ["X Offset"] = "X 偏移",
    ["Y Offset"] = "Y 偏移",
    ["Z Offset"] = "Z 偏移",
    ["Viewmodel Offset"] = "视图模型偏移",
    ["Notifications"] = "通知",
    ["Entity List"] = "实体列表",
    ["Notify Entities"] = "通知实体",
    ["Chat Notify"] = "聊天通知",
    ["Notify Message"] = "通知消息",
    ["Play Sound"] = "播放声音",
    ["Sound Volume"] = "音量",
    ["Notification Style"] = "通知样式(“门”可能不可用)",
    ["Send Notification Test"] = "发送通知测试",
    ["No Death Jumpscare"] = "无死亡惊吓",
    ["No Hiding Effects"] = "无隐藏效果",
    ["No Fog Effects"] = "无雾效",
    ["No Seek Effects"] = "无搜寻效果",
    ["No Camera Shake"] = "无相机抖动",
    ["No Camera Bobbing"] = "无相机晃动",
    ["No Timothy Jumpscare"] = "无Timothy惊吓",
    ["No Glitch Jumpscare"] = "无Glitch惊吓",
    ["No Void Jumpscare"] = "无虚空门惊吓",
    ["Automation"] = "自动化",
    ["Entities"] = "实体",
    ["Auto Breaker Puzzle"] = "自动破解谜题",
    ["Auto Heartbeat Minigame"] = "自动心跳小游戏",
    ["Auto Eat Candies"] = "自动吃糖果",
    ["Candy Ignore List"] = "糖果忽略列表",
    ["Auto Library Code"] = "自动图书馆代码",
    ["Auto Minecart"] = "自动矿车",
    ["Crouch Distance"] = "蹲下距离",
    ["Turn Distance"] = "转向距离",
    ["Predict"] = "预测",
    ["Predict"] = "去除",
    ["Basement"] = "地下室",
    ["Painting"] = "画房",
    ["Auto Play Rooms"] = "自动Rooms",
    ["Show Path"] = "显示路径",
    ["Auto Anchor Code"] = "自动锚点代码",
    ["Auto Solve Anchors"] = "自动解决锚点",
    ["Auto Unlock Padlock"] = "自动解锁挂锁",
    ["Unlock Distance"] = "解锁距离",
    ["Notify Oxygen Level"] = "通知氧气水平",
    ["Notify Hide Time"] = "通知隐藏时间",
    ["Notify Haste Time"] = "通知加速时间",
    ["Disable Firedamp Effects"] = "禁用沼气效果",
    ["Disable Vacuum"] = "禁用真空门",
    ["Disable Giggle"] = "禁用Giggle",
    ["Disable Gloombat Eggs"] = "禁用 Gloombat 蛋",
    ["Disable Dread"] = "禁用Dread",
    ["No Lookman Damage"] = "无Lookman伤害",
    ["Enable"] = "启用",
    ["Bottom"] = "身体",
    ["Mouse"] = "鼠标",
    ["Top"] = "头顶",
    ["This painting is titled"] = "这幅画标题为",
    ["Center"] = "准心",
    ["Enable Ladder Speed"] = "启用梯子速度",
    ["Fast Closet Exit"] = "快速柜子退出",
    ["No Acceleration"] = "无加速度",
    ["Enable Jumping"] = "启用跳跃",
    ["Infinite Jumps"] = "无限跳跃",
    ["Flight Speed"] = "飞行速度",
    ["Prompt"] = "提示",
    ["Instant Prompts"] = "即时互动",
    ["Prompt Clip"] = "隔墙互动",
    ["Distance Multiplier"] = "距离倍数",
    ["World"] = "世界",
    ["Door Reach"] = "开门范围",
    ["Transparent Closets"] = "透明柜子",
    ["Disablers"] = "禁用器",
    ["Bypasses"] = "绕过",
    ["Bypass"] = "绕过",
    ["Delete"] = "删除",
    ["Disable seek flood"] = "禁用dam seek液体伤害",
    ["Anticheat Bypass"] = "反作弊绕过",
    ["Oxygen level"] = "氧气水平",
    ["Position Spoof"] = "位置欺骗（无敌模式）",
    ["Spoof Position"] = "位置欺骗（无敌模式）",
    ["Noclip"] = "穿墙",
    ["Flight"] = "飞行",
    ["Auto Closet"] = "自动躲柜子",
    ["Speed Bypass"] = "绕过速度检测",
    ["Crouch Spoof"] = "假装蹲下",
    ["Anticheat Manipulation"] = "完美穿墙",
    ["Manipulation Method"] = "操纵方法",
    ["Infinite Items"] = "无限物品",
    ["Item List"] = "物品列表",
    ["Disable Seek Obstrctions"] = "禁用Seek障碍物",
    ["Disable Snare"] = "禁用地刺",
    ["Disable Dupe"] = "禁用假门",
    ["Disable Screech"] = "禁用Screech",
    ["Disable Halt"] = "禁用Halt",
    ["Disable A-90"] = "禁用A-90",
    ["No Eyes Damage"] = "无eyes伤害",
    ["No Screech Damage"] = "无screech伤害",
    ["No Halt Damage"] = "无halt伤害",
    ["No A-90 Damage"] = "无A-90伤害",
    ["Item Silent Aim"] = "物品静默瞄准",
    ["Silent Aim Range"] = "静默瞄准范围",
    ["Show Range"] = "显示范围",
    ["Rainbow ESP"] = "彩虹增强型感知",
    ["Fill Transparency"] = "填充透明度",
    ["Outline Transparency"] = "轮廓透明度",
    ["Text Transparency"] = "文字透明度",
    ["Auto Interact"] = "自动交互",
    ["Ignore List"] = "忽略列表",
    ["Jeff Items"] = "Jeff 商店",
    ["Interact Delay"] = "交互延迟",
    ["Spectate Mode"] = "观战模式",
    ["Player to Entity"] = "玩家到实体",
    ["Entity to Player"] = "实体到玩家",
    ["Spectate Entity"] = "观战实体",
    ["Selection"] = "选择",
    ["Objectives"] = "目标",
    ["Doors"] = "门",
    ["Hiding Places"] = "藏身点",
    ["Players"] = "玩家",
    ["Chests"] = "箱子",
    ["Items"] = "物品",
    ["Gold"] = "黄金",
    ["Stardust"] = "星尘",
    ["Dupe"] = "假门",
    ["Fake Doors"] = "假门",
    ["Ladders"] = "梯子",
    ["Audio Tweaks"] = "音频调整",
    ["Remove Footstep Sounds"] = "移除脚步声",
    ["Remove Jammin Music"] = "移除背景音乐",
    ["Remove Interacting Sounds"] = "移除交互声音",
    ["Remove Damage Sounds"] = "移除伤害声音",
    ["Other"] = "其他",
    ["Disable AFK Kick"] = "禁用挂机踢人",
    ["Revive"] = "复活",
    ["Kill Character"] = "自杀",
    ["Play Again"] = "重新开始",
    ["Return to Lobby"] = "返回大厅",
    ["Themes"] = "主题",
    ["Background color"] = "背景颜色",
    ["Main color"] = "主颜色",
    ["Accent color"] = "强调颜色",
    ["Outline color"] = "轮廓颜色",
    ["Font color"] = "字体颜色",
    ["Font Face"] = "字体样式",
    ["Code"] = "字体样式",
    ["Theme list"] = "主题列表",
    ["Default"] = "默认",
    ["Set as default"] = "设为默认",
    ["Custom theme name"] = "自定义主题名称",
    ["Create theme"] = "创建主题",
    ["Custom themes"] = "自定义主题",
    ["Load theme"] = "加载主题",
    ["Overwrite theme"] = "覆盖主题",
    ["Delete theme"] = "删除主题",
    ["Refresh list"] = "刷新列表",
    ["Reset default"] = "重置默认",
    ["Settings"] = "设置",
    ["Show Keybinds"] = "显示按键绑定",
    ["Custom Cursor"] = "自定义光标",
    ["Toggle Keybind"] = "切换按键绑定",
    ["Keybinds"] = "按键绑定",
    ["Are you sure"] = "你确定吗",
    ["RightControl"] = "右ctrl",
    ["DPI Scale"] = "DPI 缩放",
    ["Copy Discord Invite"] = "复制Discord邀请链接",
    ["Unload"] = "卸载脚本",
    ["Reload"] = "重新加载",
    ["Config name"] = "配置名称",
    ["Create config"] = "创建配置",
    ["Config list"] = "配置列表",
    ["Load config"] = "加载配置",
    ["Overwrite config"] = "覆盖配置",
    ["Delete config"] = "删除配置",
    ["Set as autoload"] = "设为自动加载",
    ["Reset autoload"] = "重置自动加载",
    ["Changes your walkspeed to the specified amount."] = "更改你的行走速度（开绕过速度检测可以更快！）",
    ["Current autoload config: "] = "当前自动加载配置:",
    ["Successfully bypassed the Anticheat"] = "成功绕过反作弊",
    ["It will only last until the next cutscene"] = "它只会持续到下个过场动画",
    ["The anticheat bypass has been broken"] = "反作弊绕过已失效",
    ["Get on a ladder to fix it"] = "爬上梯子修复",
    ["Your movement is now fully automated"] = "您的行动现已完全自动化",
    ["Avoid walking on the grass"] = "避免在草地上行走",
    ["Position Spoof doesn't work on A-120"] = "无敌模式在A-120上不起作用",
    ["Show Seek Path"] = "显示Seek路径",
    ["Show Eyestalk Path"] = "显示Eyestalk路径",
    ["Viusals"] = "视觉",
    ["Door"] = "门",
    ["Disable Nanner Peel"] = "禁用香蕉皮",
    ["Powerup Aura"] = "强化光环",
    ["Doors"] = "门",
    ["Chest"] = "箱子",
    ["Vine"] = "藤蔓",
    ["Lighter"] = "打火机",
    ["Flashlight"] = "手电筒",
    ["Vitamins"] = "维他命",
    ["Crucifix"] = "十字架",
    ["Skeleton Key"] = "骷髅钥匙",
    ["Gummy Flashlight"] = "手摇手电筒",
    ["Candle"] = "蜡烛",
    ["Moonlight Candle"] = "月光蜡烛",
    ["Star Vial"] = "星光小瓶",
    ["Star Bottle"] = "星光瓶",
    ["Star Jug"] = "星光桶",
    ["Laser Pointer"] = "激光笔",
    ["Battery Pack"] = "电池包",
    ["Bandage Pack"] = "绷带包",
    ["Shears"] = "剪刀",
    ["Toolshed"] = "工具棚",
    ["Glowstick"] = "荧光棒",
    ["Spotlight"] = "大灯",
    ["Straplight"] = "肩灯",
    ["Dumpster"] = "垃圾桶",
    ["Alarm Clock"] = "闹钟",
    ["Smoohie"] = "啤酒",
    ["Moonlight Smoohie"] = "月光啤酒",
    ["Gween Soda"] = "绿色汽水",
    ["Bread"] = "面包",
    ["Cheese"] = "奶酪",
    ["Donut"] = "甜甜圈",
    ["Aloe"] = "芦荟",
    ["Compass"] = "罗盘",
    ["Lantern"] = "灯笼",
    ["Lotus Petal"] = "莲花",
    ["Iron Key"] = "铁钥匙",
    ["Multi Tool"] = "多功能工具",
    ["Tip Jar"] = "小费罐",
    ["Rift Jar"] = "裂隙罐",
    ["Puzzle Painting"] = "拼图画",
    ["Library Paper"] = "密码纸",
    ["Breaker"] = "断路器",
    ["Generator Fuse"] = "保险丝",
    ["Lotus Petal"] = "花瓣",
    ["Battery"] = "电池",
    ["Bandage"] = "绷带",
    ["Glitch Fragment"] = "故障碎片",
    ["Lever"] = "拉杆",
    ["Time Lever"] = "计时器杆",
    ["Star Dust"] = "星尘",
    ["Generator"] = "发电机",
    ["Door Key"] = "门钥匙",
    ["Anchor"] = "锚点",
    ["Book"] = "书",
    ["Electrical Key"] = "配电室钥匙",
    ["Gate"] = "大门",
    ["Button"] = "按钮",
    ["Water Pump"] = "水阀",
    ["Pipe"] = "水管",
    ["Bed"] = "床",
    ["Double Bed"] = "双人床",
    ["Closet"] = "衣柜",
    ["Locker"] = "铁柜",
    ["Mouse Hole"] = "老鼠洞",
    ["Item Locker"] = "物品柜",
    ["Herb of Viridis"] = "药草",
    ["Gold"] = "黄金",
    ["Stardust Pile"] = "星尘",
    ["Vacuum"] = "虚空",
    ["THE EVIL KEY"] = "邪恶的钥匙",
    ["Hole"] = "洞",
    ["Snare"] = "陷阱",
    ["Ladder"] = "梯子",
    ["Toolbox"] = "工具箱",
    ["Fridge Locker"] = "冰箱柜",
    ["Vine Lever"] = "藤蔓断头台",
    ["Vial of Starlight"] = "星光小瓶",
    ["Bottle of Starlight"] = "星光瓶",
    ["Barrel of Starlight"] = "星光桶",
    ["Win Shield"] = "胜利护盾",
    ["Big Shield Potion"] = "大护盾药水",
    ["Small Shield Potion"] = "小护盾药水",
    ["Holy Hand Grenade"] = "神圣手雷",
    ["Max Players"] = "最大玩家数量",
    ["Modifiers"] = "修饰符",
    ["Destination"] = "目的地",
    ["Friends Only"] = "仅限好友",
    ["Create Elevator"] = "创建电梯",
    ["Import from Game UI"] = "从游戏UI导入",
    ["Damage"] = "伤害",
    ["Elevator name"] = "电梯名称",
    ["Create elevator"] = "创建电梯",
    ["Saved elevators"] = "已保存的电梯",
    ["Load elevator"] = "载入电梯",
    ["Overwrite elevator"] = "覆盖电梯",
    ["Delete elevator"] = "删除电梯",
    ["Auto Join Elevator"] = "自动加入电梯",
    ["Redeem all Codes"] = "兑换所有代码",
    ["Rejoin Server"] = "重新加入服务器",
    ["Cycle Delay"] = "周期延迟",
    ["Cycle Achievements"] = "循环成就",
    ["Pivot"] = "鬼步法",
    ["Velocity"] = "直穿法",
    ["Infinite"] = "无限",
    ["Item List"] = "物品列表",
    ["Lockpicks"] = "撬锁器",
    ["Skeleton Key"] = "骷髅钥匙",
    ["Shears"] = "剪刀",
    ["Toolbox"] = "工具箱",
    ["Toolshed"] = "工具棚",
    ["Multitool"] = "多功能工具",
    ["walkspeed"] = "行走速度",
    ["player"] = "玩家",
    ["misc"] = "其他",
    ["Creation"] = "创建",
    ["Manager"] = "配置",
    ["Saves"] = "存档",
    ["Toggle"] = "开/关",
    ["Panel Settings"] = "面板设置",
    ["CONFIRM"] = "继续",
    ["PRE-RUN SHOP"] = "准备商店",
    ["skip the key"] = "我，无“锁”不能！",
    ["temporarily boosts speed"] = "话说为什么一瓶药只能吃一口",
    ["Batteries included"] = "照亮你的美。",
    ["Basic temporary light source"] = "普通打火机，貌似可以点燃些东西",
    ["5X KNOBS BOOST"] = "5X 门把手（真有人买吗）",
    ["LASTS ONE FLOOR. ADDS 500% MULTIPLIER TO KNOBS"] = "不要99，不要88，只要49，五倍门把手带回家！",
    ["Shortcuts & easy loot"] = "剪！剪！剪！",
    ["It works here!"] = "十字架，横扫户外，做回自己！",
    ["Quietness"] = "Qcumber100汉化",
    ["HOLD"] = "长按",
    ["Ignore"] = "忽略",
    ["This is what a notification will look like."] = "通知就长这样。",
}

local TranslatedObjects = setmetatable({}, {__mode = "k"})

local function showNotification(message)
    local success, result = pcall(function()
        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "TranslationNotification"
        ScreenGui.Parent = CoreGui
        ScreenGui.ResetOnSpawn = false

        local Frame = Instance.new("Frame")
        Frame.Size = UDim2.new(0, 300, 0, 100)
        Frame.Position = UDim2.new(0.5, -150, 0.5, -50)
        Frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
        Frame.BorderColor3 = Color3.new(0.3, 0.3, 0.3)
        Frame.BorderSizePixel = 2
        Frame.Active = true
        Frame.Draggable = true
        Frame.Parent = ScreenGui

        local TextLabel = Instance.new("TextLabel")
        TextLabel.Size = UDim2.new(1, 0, 0.8, 0)
        TextLabel.Position = UDim2.new(0, 0, 0, 0)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Text = message
        TextLabel.TextColor3 = Color3.new(1, 1, 1)
        TextLabel.TextScaled = true
        TextLabel.Parent = Frame

        local CloseButton = Instance.new("TextButton")
        CloseButton.Size = UDim2.new(1, 0, 0.2, 0)
        CloseButton.Position = UDim2.new(0, 0, 0.8, 0)
        CloseButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        CloseButton.Text = "关闭"
        CloseButton.TextColor3 = Color3.new(1, 1, 1)
        CloseButton.Parent = Frame
        
        CloseButton.MouseButton1Click:Connect(function()
            ScreenGui:Destroy()
        end)

        task.delay(CONFIG.NOTIFICATION_DURATION, function()
            if ScreenGui and ScreenGui.Parent then
                ScreenGui:Destroy()
            end
        end)
        
        return ScreenGui
    end)
    
    if not success then
        warn("通知创建失败:", result)
    end
end

local function translateText(text)
    if not text or type(text) ~= "string" or text == "" then 
        return text 
    end
    
    local processedText = text:lower():gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
    
    for en, cn in pairs(Translations) do
        local enLower = en:lower()
        if processedText == enLower or processedText == enLower .. ":" then
            return cn
        end
    end
    
    for en, cn in pairs(Translations) do
        if text:lower():find(en:lower(), 1, true) then
            local escapedPattern = en:gsub("([%(%)%.%+%-%*%?%[%]%^%$%%])", "%%%1")
            local result = text:gsub(escapedPattern, cn, 1)
            if result ~= text then
                return result
            end
        end
    end
    
    return text
end

local function translateGuiElementImmediately(gui)
    if TranslatedObjects[gui] then return false end
    
    local success, originalText = pcall(function()
        return gui.Text
    end)
    
    if not success or not originalText or originalText == "" then
        TranslatedObjects[gui] = true
        return false
    end
    
    local translationSuccess, translatedText = pcall(function()
        return translateText(originalText)
    end)
    
    if translationSuccess and translatedText and translatedText ~= originalText then
        local setSuccess, setError = pcall(function()
            gui.Text = translatedText
        end)
        
        if setSuccess then
            TranslatedObjects[gui] = true
            return true
        else
            warn("设置文本失败:", setError)
        end
    end
    
    TranslatedObjects[gui] = true
    return false
end

local function batchTranslateContainerImmediately(container)
    if not container then return 0 end
    
    local translatedCount = 0
    local elementsToTranslate = {}
    
    local success, descendants = pcall(function()
        return container:GetDescendants()
    end)
    
    if not success then return 0 end
    
    for _, descendant in ipairs(descendants) do
        if (descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox")) and not TranslatedObjects[descendant] then
            table.insert(elementsToTranslate, descendant)
        end
    end
    
    for i = 1, #elementsToTranslate, CONFIG.BATCH_PROCESS_SIZE do
        local batchEnd = math.min(i + CONFIG.BATCH_PROCESS_SIZE - 1, #elementsToTranslate)
        
        for j = i, batchEnd do
            local element = elementsToTranslate[j]
            if translateGuiElementImmediately(element) then
                translatedCount = translatedCount + 1
            end
        end
        
        if batchEnd < #elementsToTranslate then
            RunService.Heartbeat:Wait()
        end
    end
    
    return translatedCount
end

local function setupTextChangeListener(gui)
    if not gui:IsA("TextLabel") and not gui:IsA("TextButton") and not gui:IsA("TextBox") then
        return
    end
    
    local connection
    connection = gui:GetPropertyChangedSignal("Text"):Connect(function()
        if not gui or not gui.Parent then
            if connection then
                connection:Disconnect()
            end
            return
        end
        
        local success, result = pcall(function()
            local currentText = gui.Text
            if currentText and currentText ~= "" then
                local translatedText = translateText(currentText)
                if translatedText ~= currentText then
                    gui.Text = translatedText
                end
            end
        end)
        
        if not success then
            warn("文本变化监听失败:", result)
        end
    end)
end

local function setupContainerListener(container)
    if not container then return end
    
    container.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
            translateGuiElementImmediately(descendant)
            setupTextChangeListener(descendant)
        end
    end)
end

local function setupEnhancedMetatableHijack()
    return pcall(function()
        local mt = getrawmetatable(game)
        if not mt then return false end
        
        local oldNewIndex = mt.__newindex
        if not oldNewIndex then return false end
        
        setreadonly(mt, false)
        
        mt.__newindex = newcclosure(function(t, k, v)
            if (t:IsA("TextLabel") or t:IsA("TextButton") or t:IsA("TextBox")) and k == "Text" then
                local original = tostring(v)
                local translated = translateText(original)
                if original ~= translated then
                    v = translated
                end
            end
            return oldNewIndex(t, k, v)
        end)
        
        setreadonly(mt, true)
        return true
    end)
end

local function setupTranslationEngine()
    local totalTranslated = 0
    
    local metatableSuccess = setupEnhancedMetatableHijack()
    
    local containers = {CoreGui}
    
    local playerGuiSuccess, playerGui = pcall(function()
        return LocalPlayer.PlayerGui
    end)
    if playerGuiSuccess then
        table.insert(containers, playerGui)
    end
    
    local starterGuiSuccess = pcall(function()
        return StarterGui
    end)
    if starterGuiSuccess then
        table.insert(containers, StarterGui)
    end
    
    for _, container in ipairs(containers) do
        if container then
            local count = batchTranslateContainerImmediately(container)
            totalTranslated = totalTranslated + count
        end
    end
    
    for _, container in ipairs(containers) do
        if container then
            setupContainerListener(container)
            
            local success, descendants = pcall(function()
                return container:GetDescendants()
            end)
            if success then
                for _, descendant in ipairs(descendants) do
                    if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
                        setupTextChangeListener(descendant)
                    end
                end
            end
        end
    end
    
    if not metatableSuccess then
        warn("元表劫持失败，使用GUI扫描方案")
    end
    
    return totalTranslated
end

local function main()
    task.wait(CONFIG.TRANSLATE_DELAY)
    
    local startTime = os.clock()
    local success, result = pcall(function()
        return setupTranslationEngine()
    end)
    
    local endTime = os.clock()
    local elapsedTime = endTime - startTime
    
    if success then
        local translatedCount = result or 0
        local message = string.format("翻译引擎加载完成 \n已立即翻译 %d 个文本元素\n耗时: %.2f 秒", translatedCount, elapsedTime)
        showNotification(message)
        print("＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝")
        print("翻译引擎加载成功 v0.4\n欢迎使用此汉化脚本")
        print("立即翻译了", translatedCount, "个文本元素")
        print("耗时:", string.format("%.2f", elapsedTime), "秒")
        print("＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝")
    else
        showNotification("翻译引擎加载失败")
        warn("翻译引擎加载失败:", result)
    end
end

main()

loadstring(game:HttpGet("https://raw.githubusercontent.com/bocaj111004/AbysallHub/refs/heads/main/Loader.lua"))()
