# -*-coding:utf-8-*-

"""
Reinforcement learning maze example.

Red rectangle:          explorer.
Black rectangles:       hells       [reward = -1].
Yellow bin circle:      paradise    [reward = +1].
All other states:       ground      [reward = 0].

This script is the environment part of this example.
The RL is in RL_brain.py.

View more on my tutorial page: https://morvanzhou.github.io/tutorials/
"""
import numpy as np
import random
import time
import sys
if sys.version_info.major == 2:
    import Tkinter as tk
else:
    import tkinter as tk    # GUI
import utils as u

UNIT = 40   # 单位长度的像素值
MAZE_H = 20  # 高度/UNIT
MAZE_W = 20  # 长度/UNIT
TOTAL_HIGH = UNIT * MAZE_H  # 高度/像素
TOTAL_LENGTH = UNIT * MAZE_W    # 长度/像素
HELF_HIGH = 0.5 * TOTAL_HIGH    # 半高
MIN_D = UNIT    # 初始最小距离
MAX_D = 10*UNIT # 初始最远距离
STEP_SIZE = 0.5 # 每次移动多大的UNIT

# 针对不同任务类型、风速、降雨量，需要的两机距离上下界
T_down = [10, 20, 40]
T_up = [20, 40, 80]
W_down = [10,11,14,19,25]
R_down = [12,14,18,26,42]
# 执行任务时的任务类型、风速、降雨量
INPUT = [0,1,2]


class Maze(tk.Tk, object):
    def __init__(self):
        super(Maze, self).__init__()
        self.action_space = ['l', 'r', 'n'] # left, right, do nothing
        self.n_actions = len(self.action_space)
        self.n_features = 2 # distance target wind rain
        self.distance_range = self.get_distance_range() # 得到无人机之间的距离范围
        self.stay_time = 0  # 记录无人机持续在规定范围内的时间长度
        self.done_time = 10 # 规定无人机持续在规定范围内多久才可以置done标志位
        self.title('maze')
        self.geometry('{0}x{1}'.format(TOTAL_HIGH, TOTAL_LENGTH))   # 画布大小
        self._build_maze()  # 相当于构造函数

    def _build_maze(self):  # GUI, wait changing!!!!!!!!!!!!!!!!!!!!!!!!!!1
        self.canvas = tk.Canvas(self, bg='white',   # 画布大小设定
                           height=TOTAL_HIGH,
                           width=TOTAL_LENGTH)

        # 画一条线
        self.canvas.create_line(0, 0.5*TOTAL_HIGH, TOTAL_LENGTH, 0.5*TOTAL_HIGH)
        # 随机产生初始点和目标点
        # origin, oval_center = self.get_random_point() # 随机得到初始点和目标点
        # 固定目标点为中心，初始点为距离26
        origin, oval_center = self.get_dixtance_fixed_26()
        # 红正方形目标
        self.rect = self.canvas.create_rectangle(
            origin - 10, HELF_HIGH - 10,
            origin + 10, HELF_HIGH + 10,
            fill='red')

        # 黄色目标点
        self.oval = self.canvas.create_oval(
            oval_center - 10, HELF_HIGH - 10,
            oval_center + 10, HELF_HIGH + 10,
            fill='yellow'
        )

        # pack all
        self.canvas.pack()


    def reset(self):    # 每次测试初始化
        self.update()
        time.sleep(0.1) # 进行下次探索等待时间    # 为什么只有第一次会等待？？？？？？？？？？
        self.canvas.delete(self.rect)   # 删除上次的控制点
        self.canvas.delete(self.oval)

        # 随机产生初始点和目标点
        # origin, oval_center = self.get_random_point() # 随机得到初始点和目标点
        # 固定目标点为中心，初始点为距离26
        origin, oval_center = self.get_dixtance_fixed_26()
        self.rect = self.canvas.create_rectangle(   # 绘图
            origin - 10, HELF_HIGH - 10,
            origin + 10, HELF_HIGH + 10,
            fill='red')

        self.oval = self.canvas.create_oval(
            oval_center - 10, HELF_HIGH - 10,
            oval_center + 10, HELF_HIGH + 10,
            fill='yellow'
        )
        # return observation
        # 需不需要改成一维？？？？？？？？
        print((np.array(self.canvas.coords(self.rect)[:2]) - np.array(self.canvas.coords(self.oval)[:2])) / TOTAL_LENGTH)
        return (np.array(self.canvas.coords(self.rect)[:2]) - np.array(self.canvas.coords(self.oval)[:2])) / TOTAL_LENGTH

    def step(self, action):
        s = self.canvas.coords(self.rect)
        base_action = np.array([0, 0])  # 基准点
        # provide go out of the canvas
        if action == 0:   # left
            if s[0] > STEP_SIZE*UNIT:
                base_action[0] -= STEP_SIZE*UNIT
        elif action == 1:   # right
            if s[0] < (MAZE_H - STEP_SIZE) * UNIT:
                base_action[0] += STEP_SIZE*UNIT
        elif action == 2:   # do nothing
            pass

        self.canvas.move(self.rect, base_action[0], base_action[1])  # move agent

        next_coords = self.canvas.coords(self.rect)  # next state

        distance = abs(next_coords[0] - self.canvas.coords(self.oval)[0]) / (STEP_SIZE * UNIT)  # 两飞机之间的距离，必须保留正负号进行return，否则不知道目标在左边还是右边
        # reward function
        if next_coords == self.canvas.coords(self.oval):    # 两机相撞，结束
            reward = -50
            done = True
        elif distance<self.distance_range[0] or distance>self.distance_range[1]:
            reward = -10
            done = False
            self.stay_time = 0  # 出了规定区域，重置时间
        else:
            reward = int(self.get_reward(distance))  # 根据两机距离计算奖励值，神经网络只能输入int型！！！！！！！！！！！！！！！！！
            self.stay_time += 1 # 保持在规定区域
            done = False

        if self.stay_time >= self.done_time:
            done = True

        s_ = (np.array(next_coords[:2]) - np.array(self.canvas.coords(self.oval)[:2])) / TOTAL_LENGTH   # s_是相对于终点的坐标差
        return s_, reward, done

    def render(self):
        # time.sleep(0.01)
        self.update()

    def get_random_point(self):
        start_random = random.randrange(0, UNIT*MAZE_W, UNIT*0.1)
        if start_random > 0.5*UNIT*MAZE_W:
            target_random = random.randrange((start_random - MAX_D) if start_random-MAX_D > 0 else 0,
                                             start_random-MIN_D,
                                             UNIT * STEP_SIZE)
        else:
            target_random = random.randrange(start_random + MIN_D,
                                             (start_random + MAX_D) if start_random + MAX_D < TOTAL_LENGTH else TOTAL_LENGTH,
                                             UNIT * STEP_SIZE)
        return start_random, target_random

    def get_dixtance_fixed_26(self):
        target_fixed = 0.5*UNIT*MAZE_W
        judge = random.randint(0,1) # 随机选择初始点在左边还是右边    # python中0和负数代表false，正数代表true
        if judge:
            start_random = target_fixed - 26 * STEP_SIZE * UNIT
        else:
            start_random = target_fixed + 26 * STEP_SIZE * UNIT
        return start_random, target_fixed


    def get_distance_range(self):
        # print(T_down[INPUT[0]])
        # print( W_down[INPUT[1]])
        # print(R_down[INPUT[2]])
        range_down = max(T_down[INPUT[0]], W_down[INPUT[1]], R_down[INPUT[2]])
        range_up = T_up[INPUT[0]]
        if range_down < range_up:
            return [range_down, range_up]
        else:
            print("出错，距离下界大于距离上界")
            exit()

    def get_reward(self, d):
        R = 0.3*d + 0.2*0.05*u.square(d) - 0.5*10000/u.square(d)
        return R
