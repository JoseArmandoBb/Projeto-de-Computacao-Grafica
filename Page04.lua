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


  function botaoproximo.handle(event)
    composer.gotoScene("Page05", {effect = "fromRight", time = 1000})
  end


  function botaovoltar.handle(event)
    composer.gotoScene("Page03", {effect = "fromLeft", time = 1000})
end

local somInicio = audio.loadSound("audios\\pag4.mp3")

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
  local Texto1 = display.newImage(sceneGroup, "imagens\\pag4\\texto.png")
  Texto1.x = display.contentCenterX 
  Texto1.y = 200
  Texto1.width = 664
  Texto1.height = 276

  local egito = display.newImage(sceneGroup, "imagens\\pag4\\egito.png")
  egito.x = display.contentCenterX - 1
  egito.y = 600
  
  local sp = display.newImage(sceneGroup, "imagens\\pag4\\sp.png")
  sp.x = display.contentCenterX 
  sp.y = 600
  
  local rj = display.newImage(sceneGroup, "imagens\\pag4\\rj.png")
  rj.x = display.contentCenterX - 16
  rj.y = 600
  
  local barraNavegacao = display.newImage(sceneGroup, "imagens\\pag4\\barradenavegao.png")
  barraNavegacao.x = display.contentCenterX - 16
  barraNavegacao.y = 900

  local function determinarImagem(posicaoBarraNavegacao)
    local larguraTela = display.contentWidth
    if posicaoBarraNavegacao < larguraTela * 0.25 then
 
        rj:toFront()
        egito:toBack()
        sp:toBack()
    elseif posicaoBarraNavegacao < larguraTela * 0.75 then
 
        egito:toFront()
        rj:toBack()
        sp:toBack()
    else
        
        sp:toFront()
        rj:toBack()
        egito:toBack()
    end
end


local function onTouchBarraNavegacao(event)
    if event.phase == "moved" then
        determinarImagem(event.x)
    end
    return true
end

-- Adiciona um ouvinte de toque à barra de navegação
barraNavegacao:addEventListener("touch", onTouchBarraNavegacao)


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