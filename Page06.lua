local C = require('Constants')
local composer = require("composer")

local scene = composer.newScene();

-- Criando a tela
function scene:create( event )
 
  local sceneGroup = self.view

  --Plano de fundo
  local background = display.newImage(sceneGroup, "imagens\\gerais\\backgroundGeral.png")
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    background.width = C.W
    background.height = C.H

  --Botão de proximo
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

  --Botão de Som
  local btSom = display.newImage(sceneGroup, "imagens\\gerais\\som.png")
  btSom.x = display.contentCenterX + 250
  btSom.y = C.MARGIN
  btSom.width = 172
  btSom.height = 42

  --Transicao de proximo
  function botaoproximo.handle(event)
    composer.gotoScene("ContraCapa", {effect = "fromRight", time = 1000})
  end

  --Transicao de voltar
  function botaovoltar.handle(event)
    composer.gotoScene("Page05", {effect = "fromLeft", time = 1000})
end

local somInicio = audio.loadSound("imagens\\teste\\pagina1.mp3")

local function tocarSomInicio()
    audio.play(somInicio)
end

local somInicio = audio.loadSound("audios\\pag6.mp3")

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


botaoproximo:addEventListener('tap', botaoproximo.handle)
botaovoltar:addEventListener('tap', botaovoltar.handle)
btSom:addEventListener("touch", onTouchBtSom)

  --Texto 1
  local Texto1 = display.newImage(sceneGroup, "imagens\\pag6\\texto.png")
  Texto1.x = display.contentCenterX 
  Texto1.y = 380
  Texto1.width = 660
  Texto1.height = 600


local semterra = display.newImage(sceneGroup, "imagens\\pag6\\semterra.png")
semterra.x = display.contentCenterX
semterra.y = 725
semterra.isVisible = false  

local comterra = display.newImage(sceneGroup, "imagens\\pag6\\comterra.png")
comterra.x = display.contentCenterX
comterra.y = 800


local function celularmexendo(event)

    if event.isShake then
        
        semterra.isVisible = true
        comterra.isVisible = false
    end
end


Runtime:addEventListener("accelerometer", celularmexendo)


end



-- mostrar as coisas
function scene:show( event )

  local sceneGroup = self.view
  local phase = event.phase

  if ( phase == "will" ) then
      

  elseif ( phase == "did" ) then
      

  end
end


-- remover as coisas
function scene:hide( event )

  local sceneGroup = self.view
  local phase = event.phase

  if ( phase == "will" ) then
      

  elseif ( phase == "did" ) then
      

  end
end


-- Destroi a tela para não consumir memoria
function scene:destroy( event )

  local sceneGroup = self.view
  sceneGroup:removeSelf()
  sceneGroup = nil

end


scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


return scene