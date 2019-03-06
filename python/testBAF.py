import pygame, sys
from pygame.locals import *

pygame.init()

DISPLAYSURF1 = pygame.display.set_mode((800, 800))
DISPLAYSURF1.fill(0,0,0)

#DISPLAYSURF2 = pygame.display.set_mode((800, 800))
#DISPLAYSURF2.fill(0,255,0)

pygame.display.set_caption("INSERT NSME LATER")
rect1 = pygame.Rect(100,150, 400, 450)
red = (255, 0, 0)
pygame.draw.rect(DISPLAYSURF1, red, rect1)


while True:
    for event in pygame.event.get():
        if event.type == QUIT:
            pygame.quit()
            sys.exit()
    pygame.display.update()
            
            
