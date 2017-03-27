# CodeCraft2017

---
## Introduction：
    This is my algorithm idea to solve the problem with an iterator based on minimized-cost flow algorithm.
    Save your workspace first to avoid lossing important data! ! !
    Put files under current folder.
    Directly run the file run in matlab.
    If everything goes well, the result of the test case can be displayed in about 0.2s while case0 no longer than 90s.

---
## Function of files:

* run.m : Execute.
    * cdn.m : The iterator.(Some strategies may under discussion.)
        * inp.m : Input data of official case0.
        * construct.m : Set super nodes and format the matrixes.
        * MCF.m : Find the minimized-cost flow.

            * short.m : Find the shortest path.

    * cvt.m : Convert the result, a flow matrix, to official format.

        * climb.m : Recursively sparsify the flow matrix into routes.

* test1.mat : Test case.
* README.md : The file you're reading.
---
