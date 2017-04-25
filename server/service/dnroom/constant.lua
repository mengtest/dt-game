local M = {}

--   显示     权重  序号
M.ALL_CARDS = {
  { '方块A'  , 1  , 1} ,
  { '梅花A'  , 1  , 2} ,
  { '红桃A'  , 1  , 3} ,
  { '黑桃A'  , 1  , 4} ,
  { '方块2'  , 2  , 5} ,
  { '梅花2'  , 2  , 6} ,
  { '红桃2'  , 2  , 7} ,
  { '黑桃2'  , 2  , 8} ,
  { '方块3'  , 3  , 9} ,
  { '梅花3'  , 3  , 10} ,
  { '红桃3'  , 3  , 11} ,
  { '黑桃3'  , 3  , 12} ,
  { '方块4'  , 4  , 13} ,
  { '梅花4'  , 4  , 14} ,
  { '红桃4'  , 4  , 15} ,
  { '黑桃4'  , 4  , 16} ,
  { '方块5'  , 5  , 17} ,
  { '梅花5'  , 5  , 18} ,
  { '红桃5'  , 5  , 19} ,
  { '黑桃5'  , 5  , 20} ,
  { '方块6'  , 6  , 21} ,
  { '梅花6'  , 6  , 22} ,
  { '红桃6'  , 6  , 23} ,
  { '黑桃6'  , 6  , 24} ,
  { '方块7'  , 7  , 25} ,
  { '梅花7'  , 7  , 26} ,
  { '红桃7'  , 7  , 27} ,
  { '黑桃7'  , 7  , 28} ,
  { '方块8'  , 8  , 29} ,
  { '梅花8'  , 8  , 30} ,
  { '红桃8'  , 8  , 31} ,
  { '黑桃8'  , 8  , 32} ,
  { '方块9'  , 9  , 33} ,
  { '梅花9'  , 9  , 34} ,
  { '红桃9'  , 9  , 35} ,
  { '黑桃9'  , 9  , 36} ,
  { '方块10' , 10 , 37} ,
  { '梅花10' , 10 , 38} ,
  { '红桃10' , 10 , 39} ,
  { '黑桃10' , 10 , 40} ,
  { '方块J'  , 11 , 41} ,
  { '梅花J'  , 11 , 42} ,
  { '红桃J'  , 11 , 43} ,
  { '黑桃J'  , 11 , 44} ,
  { '方块Q'  , 12 , 45} ,
  { '梅花Q'  , 12 , 46} ,
  { '红桃Q'  , 12 , 47} ,
  { '黑桃Q'  , 12 , 48} ,
  { '方块K'  , 13 , 49} ,
  { '梅花K'  , 13 , 50} ,
  { '红桃K'  , 13 , 51} ,
  { '黑桃K'  , 13 , 52} ,  
}

M.CARD_MOUNT = #M.ALL_CARDS

M.CARD_TYPES = {
  ['Single']   = 'SINGLE',     -- 单张
  
}



return M