![and_gates](./gates.png)

| **A** | **NOT** |
| :-: | :-: |
| 0 | 1 |
| 1 | 0 |

| **A** | **B** | **AND** | **NAND** |
| :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | 1 |
| 0 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 0 |

| **A** | **B** | **OR** | **NOR** |
| :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | 1 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 1 | 0 |

| **A** | **B** | **XOR** | **XNOR** |
| :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | 1 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 |




De Morgan

![De Morgan](./demorgan.png)

(<a href="https://www.codecogs.com/eqnedit.php?latex=\displaystyle&space;f&space;=a\cdot\overline{b}&plus;\overline{b}\cdot\overline{c}&space;\newline&space;\newline&space;\displaystyle&space;f_{AND}=&space;\overline{\overline{a\cdot&space;\overline{b}}\cdot&space;\overline{\overline{b}\cdot&space;\overline{c}}}&space;\newline&space;\newline&space;\displaystyle&space;f_{OR}&space;=&space;\overline{\overline{a}&plus;b}&plus;\overline{b&plus;c}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\displaystyle&space;f&space;=a\cdot\overline{b}&plus;\overline{b}\cdot\overline{c}&space;\newline&space;\newline&space;\displaystyle&space;f_{AND}=&space;\overline{\overline{a\cdot&space;\overline{b}}\cdot&space;\overline{\overline{b}\cdot&space;\overline{c}}}&space;\newline&space;\newline&space;\displaystyle&space;f_{OR}&space;=&space;\overline{\overline{a}&plus;b}&plus;\overline{b&plus;c}" title="\displaystyle f =a\cdot\overline{b}+\overline{b}\cdot\overline{c} \newline \newline \displaystyle f_{AND}= \overline{\overline{a\cdot \overline{b}}\cdot \overline{\overline{b}\cdot \overline{c}}} \newline \newline \displaystyle f_{OR} = \overline{\overline{a}+b}+\overline{b+c}" /></a>)

    
&nbsp;

| **A** | **B** |**C** | ![equation](https://latex.codecogs.com/gif.latex?f) | ![equation](https://latex.codecogs.com/gif.latex?f_%7BAND%7D) | ![equation](https://latex.codecogs.com/gif.latex?f_%7BOR%7D) |
| :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | 1 | 1 | 1 |
| 0 | 0 | 1 | 0 | 0 | 0 |
| 0 | 1 | 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 | 0 | 0 |
| 1 | 0 | 0 | 1 | 1 | 1 |
| 1 | 0 | 1 | 1 | 1 | 1 |
| 1 | 1 | 0 | 0 | 0 | 0 |
| 1 | 1 | 1 | 0 | 0 | 0 |
