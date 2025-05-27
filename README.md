\section*{C.1 Grid Generation for a Cavity with an Axial-Through Flow}

We have developed a structured grid-generation tool for a cavity with an axial-through flow, based on the elliptic-grid method proposed by Eça \cite{eca85}.  Among the various grid-quality metrics, orthogonality is the most critical—and the hardest to achieve in complex geometries.  In this approach, the mesh coordinates \((x,y)\) are obtained by solving the following coupled elliptic equations:

\begin{subequations}\label{eq:ellipticGrid}
\begin{align}
  \frac{\partial}{\partial \xi}\!\Bigl(f\,\frac{\partial x}{\partial \xi}\Bigr)
+ \frac{\partial}{\partial \eta}\!\Bigl(f\,\frac{\partial x}{\partial \eta}\Bigr)
  &= 0, \\
  \frac{\partial}{\partial \xi}\!\Bigl(f\,\frac{\partial y}{\partial \xi}\Bigr)
+ \frac{\partial}{\partial \eta}\!\Bigl(f\,\frac{\partial y}{\partial \eta}\Bigr)
  &= 0,
\end{align}
\end{subequations}

where the distortion (monitor) function \(f\) is defined as the ratio of the covariant base–vector lengths,
\[
  f \;=\; \frac{h_\eta}{h_\xi},
\]
with
\[
  h_\xi \;=\;\sqrt{\Bigl(\frac{\partial x}{\partial \xi}\Bigr)^{2}
                   +\Bigl(\frac{\partial y}{\partial \xi}\Bigr)^{2}
             }\,, 
\quad
  h_\eta\;=\;\sqrt{\Bigl(\frac{\partial x}{\partial \eta}\Bigr)^{2}
                   +\Bigl(\frac{\partial y}{\partial \eta}\Bigr)^{2}
             }.
\]

We initialize \(f\) (and hence the grid) using a transfinite-interpolation guess, then iterate Equations \eqref{eq:ellipticGrid} until the residuals fall below our convergence threshold.  The final mesh for the cavity is shown in Figure C.1.

\medskip
\noindent
\textbf{Reference}\\
\noindent
[85] Eça, L. Method of elliptic grid generation for complex internal flows. \emph{J. Comput. Phys.}, 85 (19—Year).
