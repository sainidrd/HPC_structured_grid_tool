
The repository includes a structured grid-generation tool for a cavity with an axial-through flow, based on the elliptic-grid method.  Among the various grid-quality metrics, orthogonality is the most critical—and the hardest to achieve in complex geometries.  In this approach, the mesh coordinates \((x,y)\) are obtained by solving the following coupled elliptic equations:


## Elliptic Grid Equations

We generate the mesh coordinates \((x,y)\) by solving the coupled elliptic PDEs:

$$
\frac{\partial}{\partial \xi}\Bigl(f\,\frac{\partial x}{\partial \xi}\Bigr)
\;+\;
\frac{\partial}{\partial \eta}\Bigl(f\,\frac{\partial x}{\partial \eta}\Bigr)
\;=\;0,
$$

$$
\frac{\partial}{\partial \xi}\Bigl(f\,\frac{\partial y}{\partial \xi}\Bigr)
\;+\;
\frac{\partial}{\partial \eta}\Bigl(f\,\frac{\partial y}{\partial \eta}\Bigr)
\;=\;0.
$$

Here the monitor (distortion) function \(f\) is the ratio of the covariant base-vector lengths,

$$
f = \frac{h_\eta}{h_\xi},
$$

with

$$
h_\xi = \sqrt{\Bigl(\frac{\partial x}{\partial \xi}\Bigr)^{2}
            +\Bigl(\frac{\partial y}{\partial \xi}\Bigr)^{2}
       },
\qquad
h_\eta = \sqrt{\Bigl(\frac{\partial x}{\partial \eta}\Bigr)^{2}
               +\Bigl(\frac{\partial y}{\partial \eta}\Bigr)^{2}
          }.
$$

We initialize \(f\) via transfinite interpolation, then iterate the above equations until the residuals meet our convergence criterion.

## Citations

If you use or build upon this grid‐generation tool, please cite the following:
```python
@article{saini2021large,
  title={Large-eddy simulations of high rossby number flow in the high-pressure compressor inter-disk cavity},
  author={Saini, Deepak and Sandberg, Richard D},
  journal={Journal of Turbomachinery},
  volume={143},
  number={11},
  pages={111002},
  year={2021},
  publisher={American Society of Mechanical Engineers}
}

@phdthesis{saini2021characterization,
  title={Characterization of Fluid Flow and Heat Transfer in Rotating Convection Systems},
  author={Saini, Deepak},
  year={2021},
  school={UNIVERSITY OF MELBOURNE}
}
```


# References
- [1] Saini, Deepak, and Richard D. Sandberg. "Large-eddy simulations of high rossby number flow in the high-pressure compressor inter-disk cavity." Journal of Turbomachinery 143, no. 11 (2021): 111002.
- [2] Saini, Deepak. 2021. ‘Characterization of Fluid Flow and Heat Transfer in Rotating Convection Systems’. Thesis: The University of Melbourne, Available at: https://www.researchgate.net/publication/392104527_Characterization_of_Fluid_Flow_and_Heat_Transfer_in_Rotating_Convection_Systems
