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

  --Desenho no centro
  local DesenhoCentro = display.newImage(sceneGroup, "imagens\\capa\\grupodacapa.png")
  DesenhoCentro.x = display.contentCenterX
  DesenhoCentro.y = display.contentCenterY
  DesenhoCentro.width = 715
  DesenhoCentro.height = 822
  --Botão de proximo
  local botaoproximo = display.newImage(sceneGroup, "imagens\\gerais\\proximo.png")
  botaoproximo.x = 696
  botaoproximo.y = 950
  botaoproximo.width = 100
  botaoproximo.height = 100
  
  --Botão de Som
  local btSom = display.newImage(sceneGroup, "imagens\\gerais\\som.png")
  btSom.x = display.contentCenterX + 250
  btSom.y = C.MARGIN
  btSom.width = 172
  btSom.height = 42


  --Transicao de proximo
  function botaoproximo.handle(event)
    composer.gotoScene("Page01", {effect = "fromRight", time = 1000})
  end


local somInicio = audio.loadSound("audios\\capa.mp3")

local function tocarSomInicio()
    audio.play(somInicio)
end

local function pararSomInicio()
    audio.stop()
end

-- Funcao para ligar e desligar o som
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
btSom:addEventListener("touch", onTouchBtSom)

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