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
    composer.gotoScene("Page06", {effect = "fromRight", time = 1000})
  end

  --Transicao de voltar
  function botaovoltar.handle(event)
    composer.gotoScene("Page04", {effect = "fromLeft", time = 1000})
end

local somInicio = audio.loadSound("imagens\\teste\\pagina1.mp3")

local function tocarSomInicio()
    audio.play(somInicio)
end

local function pararSomInicio()
    audio.stop()
end

local somInicio = audio.loadSound("audios\\pag5.mp3")

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
  local Texto1 = display.newImage(sceneGroup, "imagens\\pag5\\texto.png")
  Texto1.x = display.contentCenterX
  Texto1.y = 350
  Texto1.width = 664
  Texto1.height = 550

  local mesa = display.newImage(sceneGroup, "imagens\\pag5\\mesa.png")
  mesa.x = display.contentCenterX
  mesa.y = 980

  local lapis = display.newImage(sceneGroup, "imagens\\pag5\\lapis.png")
  lapis.x = display.contentCenterX
  lapis.y = 960

  local joia = display.newImage(sceneGroup, "imagens\\pag5\\joia.png")
  joia.x = display.contentCenterX - 200
  joia.y = 770

  local fossil = display.newImage(sceneGroup, "imagens\\pag5\\fossil.png")
  fossil.x = display.contentCenterX 
  fossil.y = 770
  
  local cidade = display.newImage(sceneGroup, "imagens\\pag5\\cidade.png")
  cidade.x = display.contentCenterX + 200
  cidade.y = 770

  local folha1 = display.newImage(sceneGroup, "imagens\\pag5\\folha.png")
  folha1.x = display.contentCenterX - 200
  folha1.y = 770

  local folha2 = display.newImage(sceneGroup, "imagens\\pag5\\folha.png")
  folha2.x = display.contentCenterX 
  folha2.y = 770
  
  local folha3 = display.newImage(sceneGroup, "imagens\\pag5\\folha.png")
  folha3.x = display.contentCenterX + 200
  folha3.y = 770
  
  
-- Fazer a colisao da folha com o lapis
local function reorganizarOrdemExibicao()
  
  local colisaoFolha1 = false
  local colisaoFolha2 = false
  local colisaoFolha3 = false
  
  
  if lapis and folha1 and lapis.contentBounds and folha1.contentBounds then
      colisaoFolha1 = lapis.contentBounds.xMin < folha1.contentBounds.xMax and
                      lapis.contentBounds.xMax > folha1.contentBounds.xMin and
                      lapis.contentBounds.yMin < folha1.contentBounds.yMax and
                      lapis.contentBounds.yMax > folha1.contentBounds.yMin
  end
  
  if lapis and folha2 and lapis.contentBounds and folha2.contentBounds then
      colisaoFolha2 = lapis.contentBounds.xMin < folha2.contentBounds.xMax and
                      lapis.contentBounds.xMax > folha2.contentBounds.xMin and
                      lapis.contentBounds.yMin < folha2.contentBounds.yMax and
                      lapis.contentBounds.yMax > folha2.contentBounds.yMin
  end

  if lapis and folha3 and lapis.contentBounds and folha3.contentBounds then
      colisaoFolha3 = lapis.contentBounds.xMin < folha3.contentBounds.xMax and
                      lapis.contentBounds.xMax > folha3.contentBounds.xMin and
                      lapis.contentBounds.yMin < folha3.contentBounds.yMax and
                      lapis.contentBounds.yMax > folha3.contentBounds.yMin
  end

  
  if colisaoFolha1 then
      joia:toFront()
  elseif colisaoFolha2 then
      fossil:toFront()
  elseif colisaoFolha3 then
      cidade:toFront()
  end
end

local function onTouchLapis(event)
  if event.phase == "moved" then

      lapis.x = event.x
      lapis.y = event.y
    
      reorganizarOrdemExibicao()
  end
  return true
end

lapis:addEventListener("touch", onTouchLapis)


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