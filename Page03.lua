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
    composer.gotoScene("Page04", {effect = "fromRight", time = 1000})
  end

  --Transicao de voltar
  function botaovoltar.handle(event)
    composer.gotoScene("Page02", {effect = "fromLeft", time = 1000})
end

local somInicio = audio.loadSound("audios\\pag3.mp3")

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
  local Texto1 = display.newImage(sceneGroup, "imagens\\pag3\\texto.png")
  Texto1.x = display.contentCenterX 
  Texto1.y = 200
  Texto1.width = 664
  Texto1.height = 276


  local mapamundi = display.newImage(sceneGroup, "imagens\\pag3\\mapamundi.png")
  mapamundi.x = display.contentCenterX
  mapamundi.y = 700

  local aviao = display.newImage(sceneGroup, "imagens\\pag3\\aviao.png")
  aviao.x = display.contentCenterX -100
  aviao.y = 950
  aviao.width = 80
  aviao.height = 80

  local roxo = display.newImage(sceneGroup, "imagens\\pag3\\roxo.png")
  roxo.x = display.contentCenterX -10
  roxo.y = 950
  roxo.width = 50
  roxo.height = 50

  local azul = display.newImage(sceneGroup, "imagens\\pag3\\azul.png")
  azul.x = display.contentCenterX + 70
  azul.y = 950
  azul.width = 50
  azul.height = 50

  local verde = display.newImage(sceneGroup, "imagens\\pag3\\verde.png")
  verde.x = display.contentCenterX + 150
  verde.y = 950
  verde.width = 50
  verde.height = 50

  local machu = display.newImage(sceneGroup, "imagens\\pag3\\machu.png")
  machu.x = display.contentCenterX + 17
  machu.y = 559

  local catimbau = display.newImage(sceneGroup, "imagens\\pag3\\catimbau.png")
  catimbau.x = display.contentCenterX - 8
  catimbau.y = 543

  local egito = display.newImage(sceneGroup, "imagens\\pag3\\egito.png")
  egito.x = display.contentCenterX + 40
  egito.y = 483



  machu.isVisible = false
  egito.isVisible = false
  catimbau.isVisible = false
  
  local function verificarToque()
      if aviao.isFocus and roxo.isFocus then
  
          machu.isVisible = true
          egito.isVisible = false
          catimbau.isVisible = false
      elseif aviao.isFocus and verde.isFocus then

          catimbau.isVisible = true
          machu.isVisible = false
          egito.isVisible = false
      elseif aviao.isFocus and azul.isFocus then
 
          egito.isVisible = true
          machu.isVisible = false
          catimbau.isVisible = false
      else

          machu.isVisible = false
          egito.isVisible = false
          catimbau.isVisible = false
      end
  end
  

  local function onTouch(event)
      if event.phase == "began" or event.phase == "ended" then

          if event.target == aviao or event.target == roxo or event.target == verde or event.target == azul then
  
              aviao.isFocus = (event.target == aviao)
              roxo.isFocus = (event.target == roxo)
              verde.isFocus = (event.target == verde)
              azul.isFocus = (event.target == azul)

              verificarToque()
          end
      end
      return true  -- Indica que o evento foi tratado
  end
  
  -- Adiciona ouvintes de toque às imagens
  aviao:addEventListener("touch", onTouch)
  roxo:addEventListener("touch", onTouch)
  verde:addEventListener("touch", onTouch)
  azul:addEventListener("touch", onTouch)


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