local composer = require("composer")
local physics = require("physics")

local scene = composer.newScene()

function scene:create(event)
    local sceneGroup = self.view

    --Plano de fundo
    local background = display.newImage(sceneGroup, "imagens\\gerais\\backgroundGeral.png")
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    background.width = display.contentWidth
    background.height = display.contentHeight

    --Botão de próximo
    local botaoproximo = display.newImage(sceneGroup, "imagens\\gerais\\proximo.png")
    botaoproximo.x = 696
    botaoproximo.y = 950
    botaoproximo.width = 100
    botaoproximo.height = 100

    --Botão de voltar
    local botaovoltar = display.newImage(sceneGroup, "imagens\\gerais\\voltar.png")
    botaovoltar.x = 66
    botaovoltar.y = 950
    botaovoltar.width = 100
    botaovoltar.height = 100

    -- Botão de Som
    local btSom = display.newImage(sceneGroup, "imagens\\gerais\\som.png")
    btSom.x = display.contentCenterX + 250
    btSom.y = 60
    btSom.width = 172
    btSom.height = 42


    local function goToNextPage()
        composer.gotoScene("Page03", { effect = "fromRight", time = 1000 })
    end


    local function goToPreviousPage()
        composer.gotoScene("Page01", { effect = "fromLeft", time = 1000 })
    end

    local somInicio = audio.loadSound("audios\\pag2.mp3")

    local function tocarSomInicio()
        audio.play(somInicio)
    end

    local function pararSomInicio()
        audio.stop()
    end


    local function onTouchBtSom(event)
        if event.phase == "ended" then

            local estaTocando = audio.isChannelPlaying(1)
            if estaTocando then

                pararSomInicio()
            else

                tocarSomInicio()
            end
        end
        return true
    end


    botaoproximo:addEventListener('tap', goToNextPage)
    botaovoltar:addEventListener('tap', goToPreviousPage)
    btSom:addEventListener("touch", onTouchBtSom)

    -- Texto 1
    local Texto1 = display.newImage(sceneGroup, "imagens\\pag2\\texto.png")
    Texto1.x = display.contentCenterX
    Texto1.y = 350
    Texto1.width = 664
    Texto1.height = 600

    local atomo2 = display.newImage(sceneGroup, "imagens\\pag2\\atomo2.png")
    atomo2.x = display.contentCenterX + 250
    atomo2.y = 200


    physics.start()


    local bola1 = display.newImage(sceneGroup, "imagens\\pag2\\bola.png")
    bola1.x = display.contentCenterX + 170
    bola1.y = 205
    physics.addBody(bola1, "dynamic")

    local bola2 = display.newImage(sceneGroup, "imagens\\pag2\\bola.png")
    bola2.x = display.contentCenterX + 250
    bola2.y = 286
    physics.addBody(bola2, "dynamic")
    bola2.linearDamping = 1

    local bola3 = display.newImage(sceneGroup, "imagens\\pag2\\bola.png")
    bola3.x = display.contentCenterX + 335
    bola3.y = 205
    physics.addBody(bola3, "dynamic")
    bola3.linearDamping = 2

    local ampulheta = display.newImage(sceneGroup, "imagens\\pag2\\ampulheta.png")
    ampulheta.x = display.contentCenterX
    ampulheta.y = display.contentHeight - 100
    ampulheta.width = 100
    ampulheta.height = 100


    local tempo1 = display.newImage(sceneGroup, "imagens\\pag2\\tempo1.png")
    tempo1.x = display.contentCenterX - 250
    tempo1.y = 750
    tempo1.width = 100
    tempo1.height = 120
    tempo1.isVisible = false

    local tempo2 = display.newImage(sceneGroup, "imagens\\pag2\\tempo2.png")
    tempo2.x = display.contentCenterX
    tempo2.y = 750
    tempo2.width = 100
    tempo2.height = 120
    tempo2.isVisible = false

    local tempo3 = display.newImage(sceneGroup, "imagens\\pag2\\tempo3.png")
    tempo3.x = display.contentCenterX + 250
    tempo3.y = 750
    tempo3.width = 100
    tempo3.height = 120
    tempo3.isVisible = false

    
    local linhaguia = display.newLine(sceneGroup, bola1.x + 15, bola1.y, tempo1.x, tempo1.y)
    linhaguia.strokeWidth = 2
    linhaguia:setStrokeColor(1, 0, 0)
    linhaguia.alpha = 0
    physics.addBody(linhaguia, "static", { friction = 0.5, bounce = 0.3 })

    local linhaguia1 = display.newLine(sceneGroup, display.contentCenterX - 650, 840, display.contentCenterX, 840)
    linhaguia1.strokeWidth = 2
    linhaguia1:setStrokeColor(1, 0, 0)
    linhaguia1.x = display.contentCenterX - 300
    linhaguia1.y = display.contentCenterY + 240
    linhaguia1.alpha = 0
    physics.addBody(linhaguia1, "static", { friction = 0.5, bounce = 0.3 })

    local linhaguia2 = display.newLine(sceneGroup, display.contentCenterX, 0, display.contentCenterX, display.contentHeight * 0.1)
    linhaguia2.strokeWidth = 2
    linhaguia2:setStrokeColor(1, 0, 0)
    linhaguia2.alpha = 0
    linhaguia2.x = display.contentCenterX - 300
    linhaguia2.y = display.contentCenterY + 140
    physics.addBody(linhaguia2, "static", { friction = 0.5, bounce = 0.3 })

    local linhaguia3 = display.newLine(sceneGroup, bola2.x + 15, bola2.y, tempo2.x, tempo2.y)
    linhaguia3.strokeWidth = 2
    linhaguia3:setStrokeColor(1, 0, 0)
    linhaguia3.alpha = 0
    physics.addBody(linhaguia3, "static", { friction = 0.5, bounce = 0.3 })

    local linhaguia4 = display.newLine(sceneGroup, display.contentCenterX, 0, display.contentCenterX, display.contentHeight * 0.1)
    linhaguia4.strokeWidth = 2
    linhaguia4.x = display.contentCenterX - 50
    linhaguia4.y = display.contentCenterY + 140
    linhaguia4.alpha = 0
    physics.addBody(linhaguia4, "static", { friction = 0.5, bounce = 0.3 })

    local linhaguia5 = display.newLine(sceneGroup, bola3.x + 15, bola3.y, tempo3.x, tempo3.y)
    linhaguia5.strokeWidth = 2
    linhaguia5:setStrokeColor(0, 0, 1)
    linhaguia5.alpha = 0
    physics.addBody(linhaguia5, "static", { friction = 0.5, bounce = 0.3 })

    local linhaguia6 = display.newLine(sceneGroup, display.contentCenterX, 0, display.contentCenterX, display.contentHeight * 0.1)
    linhaguia6.strokeWidth = 2
    linhaguia6.x = display.contentCenterX + 210
    linhaguia6.y = display.contentCenterY + 140
    linhaguia6.alpha = 0
    physics.addBody(linhaguia6, "static", { friction = 0.5, bounce = 0.3 })

    physics.pause()

    -- Ligar a fisica com a ampulheta
    local function onTouchAmpulheta(event)
        if event.phase == "ended" then
            physics.start()
            timer.performWithDelay(2800, function() tempo1.isVisible = true end)
            timer.performWithDelay(3200, function() tempo2.isVisible = true end)
            timer.performWithDelay(4100, function() tempo3.isVisible = true end)
        end
    end
    ampulheta:addEventListener("touch", onTouchAmpulheta)

    -- colocar a colisao na linhas para as bolas irem para o lugar certo
    local function onCollision(event)
        if event.phase == "began" then
            local bola = event.object1
            local linha = event.object2
            if bola == bola1 or bola == bola2 or bola == bola3 then
                bola:setLinearVelocity(0, 0)
                bola.y = 840 - bola.height / 2
            end
            if linha == linhaguia2 or linha == linhaguia4 or linha == linhaguia6 then
                if bola == bola1 then
                    tempo1.isVisible = true
                elseif bola == bola2 then
                    tempo2.isVisible = true
                elseif bola == bola3 then
                    tempo3.isVisible = true
                end
            end
        end
    end
    Runtime:addEventListener("collision", onCollision)
end

function scene:hide(event)
    local phase = event.phase
    if phase == "will" then
        physics.pause() 
    end
end

function scene:destroy(event)
    local phase = event.phase
    if phase == "will" then
        physics.pause()
    end
end

scene:addEventListener("create", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
