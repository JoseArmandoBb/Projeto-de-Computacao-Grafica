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
  local DesenhoCentro = display.newImage(sceneGroup, "imagens\\contracapa\\textofinais.png")
  DesenhoCentro.x = display.contentCenterX
  DesenhoCentro.y = display.contentCenterY - 150
  DesenhoCentro.width = 710
  DesenhoCentro.height = 457

  --lgo UPE
  local upe = display.newImage(sceneGroup, "imagens\\contracapa\\logoUpe.png")
  upe.x = display.contentCenterX
  upe.y = display.contentCenterY + 150
  upe.width = 300
  upe.height = 171

  --Botão de voltar
  local botaovoltar = display.newImage(sceneGroup, "imagens\\contracapa\\botaovoltar.png")
  botaovoltar.x = 66
  botaovoltar.y = 950
  botaovoltar.width = 100
  botaovoltar.height = 100

   --Botão de voltarincio
   local voltarincio = display.newImage(sceneGroup, "imagens\\contracapa\\comecar.png")
   voltarincio.x = 650
   voltarincio.y = 970
   voltarincio.width = 147
   voltarincio.height = 37

  --Botão de Som
  local btSom = display.newImage(sceneGroup, "imagens\\gerais\\som.png")
  btSom.x = display.contentCenterX + 250
  btSom.y = C.MARGIN
  btSom.width = 172
  btSom.height = 42

  --Transicao de proximo
  function botaovoltar.handle(event)
    composer.gotoScene("Page06", {effect = "fromLeft", time = 1000})
  end

  function voltarincio.handle(event)
    composer.gotoScene("Capa", {effect = "fromRight", time = 1000})
  end


  local somInicio = audio.loadSound("audios\\ContraCapa.mp3")

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

  botaovoltar:addEventListener('tap', botaovoltar.handle)
  voltarincio:addEventListener('tap', voltarincio.handle)
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