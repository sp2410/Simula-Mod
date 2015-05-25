%%MonteCarloSimulation for : When shopping with a partner, problems arise when 
%you inadvertently separate. Logical minds naturally ponder the most efficient 
%way to re-connect. Should one partner stay put while the other searches, or should 
%both randomly wander about the store until they meet again?


function meeting(step_num,j,k,l,q)
% This code is for the simulation in which both are moving 
%j and k specifies dimension of the supermarket in metres (say)
%  l is the grid size
%q is the vision range


%Clear the plotting frame.
  clf
hold on



%set grid size
  set(gca,'Xtick',[0:1:l])
  set(gca,'Ytick',[0:1:l])
  
  grid off
grid on

  x1 = (j).*rand(step_num+1,1); % randomly intialised in range of j value, but this matrix will be later on transformed in the loop itself
  y1 = (k).*rand(step_num+1,1);% randomly intialised in range of k value, but this matrix will be later on transformed in the loop itself
  x2 = (j).*rand(step_num+1,1);% randomly intialised in range of j value, but this matrix will be later on transformed in the loop itself
  y2 = (k).*rand(step_num+1,1); % randomly intialised in range of k value, but this matrix will be later on transformed in the loop itself
 
  e=1;
  
  display(tic)

  for step = 2 : step_num + 1
   e=e+1;

%  We are currently at ( X(STEP-1), Y(STEP-1) ).
%  Consider the four possible points to step to.
  
  destination = [ x1(step-1) + 0.5, y1(step-1); ...
                      x1(step-1) - 0.5, y1(step-1); ...
                      x1(step-1), y1(step-1) + 0.5; ...
                      x1(step-1), y1(step-1)- 0.5 ];
                  
 destination1 = [ x2(step-1) + 0.5, y2(step-1); ...
                      x2(step-1) - 0.5, y2(step-1); ...
                      x2(step-1), y2(step-1) + 0.5; ...
                      x2(step-1), y2(step-1)- 0.5];
                  
%  Choose destination 1, 2, 3 or 4.
    k = ceil ( 4.0 * rand );       
    
%  Move there.

      x1(step) = destination(k,1);
      y1(step) = destination(k,2);
      x2(step) = destination1(k,1);
      y2(step) = destination1(k,2);
      
   if(((round(x1(step)-x2(step))))<q & ((round(y1(step)-y2(step)))<q))
   display('found') % tracks when the two met, in accordance with e, displayed on the command widow
   display(toc);
   display(e);
   
   
   end
  end

 for step = 2 : step_num
      plot ( [ x1(step-1), x1(step) ], [ y1(step-1), y1(step) ], 'g', 'LineWidth', 1 );
      hold on
      plot ( [ x2(step-1), x2(step) ], [ y2(step-1), y2(step) ], 'r', 'LineWidth', 1 );
     hold on
     
    end
   
  
 

hold off
 return
end
