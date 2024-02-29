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
    composer.gotoScene("Page02", {effect = "fromRight", time = 1000})
  end

  --Transicao de voltar
  function botaovoltar.handle(event)
    composer.gotoScene("Capa", {effect = "fromLeft", time = 1000})
end

local somInicio = audio.loadSound("audios\\pag1.mp3")

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
botaovoltar:addEventListener('tap', botaovoltar.handle)
btSom:addEventListener("touch", onTouchBtSom)

  --Texto 1
  local Texto1 = display.newImage(sceneGroup, "imagens\\pag1\\texto1.png")
  Texto1.x = display.contentCenterX 
  Texto1.y = 190
  Texto1.width = 664
  Texto1.height = 276

  --Texto 2
  local Texto2 = display.newImage(sceneGroup, "imagens\\pag1\\texto2.png")
  Texto2.x = display.contentCenterX 
  Texto2.y = 760
  Texto2.width = 671
  Texto2.height = 307


local picareta = display.newImage(sceneGroup, "imagens\\pag1\\pick.png")
picareta.width = 220
picareta.height = 200
picareta.x = 640
picareta.y = 450
local imagem1 = display.newImage(sceneGroup, "imagens\\pag1\\terra1.png")
imagem1.width = 280
imagem1.height = 250
imagem1.x = display.contentCenterX
imagem1.y = display.contentCenterY - 50
local imagem2 = display.newImage(sceneGroup, "imagens\\pag1\\terra2.png")
imagem2.width = 280
imagem2.height = 250
imagem2.x = display.contentCenterX
imagem2.y = display.contentCenterY - 50
local imagem3 = display.newImage(sceneGroup, "imagens\\pag1\\terra3.png")
imagem3.width = 280
imagem3.height = 250
imagem3.x = display.contentCenterX
imagem3.y = display.contentCenterY - 50

imagem2.alpha = 0
imagem3.alpha = 0

-- Quando tocar na picareta vai mudar as imagens
local function onTouch(event)
    if event.phase == "ended" then
        
        if event.target == picareta then
            
            if imagem1.alpha == 1 then
                transition.fadeOut(imagem1, {time = 500})
                transition.fadeIn(imagem2, {time = 500})
            elseif imagem2.alpha == 1 then
                transition.fadeOut(imagem2, {time = 500})
                transition.fadeIn(imagem3, {time = 500})
            end
        end
    end
    return true  
end

picareta:addEventListener("touch", onTouch)


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