
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
