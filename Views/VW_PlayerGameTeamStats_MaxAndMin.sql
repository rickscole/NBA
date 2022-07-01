/****** Object:  View [NBA].[VW_PlayerGameTeamStats_MaxAndMin]    Script Date: 7/1/2022 2:27:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE view [NBA].[VW_PlayerGameTeamStats_MaxAndMin] as

select 
[Group] = '>= 2500'
,[Team ID]
,[Season]
-- MIN
,[Min Points Per Minute]                        = min([Avg Points Per Minute])
,[Min Plus Minus Per Minute]                    = min([Avg Plus Minus Per Minute])                    
,[Min Field Goals Made Per Minute]              = min([Avg Field Goals Made Per Minute])              
,[Min Field Goals Attempted Per Minute]         = min([Avg Field Goals Attempted Per Minute]) 
,[Min Free Throws Made Per Minute]                = min([Avg Free Throws Made Per Minute])                
,[Min Free Throws Attempted Per Minute]           = min([Avg Free Throws Attempted Per Minute])           
,[Min Three Pointers Made Per Minute]             = min([Avg Three Pointers Made Per Minute])             
,[Min Three Pointers Attempted Per Minute]        = min([Avg Three Pointers Attempted Per Minute])        
,[Min Offensive Rebounds Per Minute]            = min([Avg Offensive Rebounds Per Minute])            
,[Min Defensive Rebounds Per Minute]            = min([Avg Defensive Rebounds Per Minute])            
,[Min Total Rebounds Per Minute]                = min([Avg Total Rebounds Per Minute])                
,[Min Assists Per Minute]                       = min([Avg Assists Per Minute])                       
,[Min Personal Fouls Per Minute]                = min([Avg Personal Fouls Per Minute])                
,[Min Turnovers Per Minute]                     = min([Avg Turnovers Per Minute])                     
,[Min Blocks Per Minute]                        = min([Avg Blocks Per Minute])                        
,[Min Points]                          = min([Avg Points])                          
,[Min Plus Minus]                      = min([Avg Plus Minus])                      
,[Min Field Goals Made]                = min([Avg Field Goals Made])                
,[Min Field Goals Attempted]           = min([Avg Field Goals Attempted])           
,[Min Field Goal %]                             = min([Avg Field Goal %])                             
,[Min Free Throws Made]                = min([Avg Free Throws Made])                
,[Min Free Throws Attempted]           = min([Avg Free Throws Attempted])           
,[Min Free Throw %]                             = min([Avg Free Throw %])                             
,[Min Three Pointers Made]             = min([Avg Three Pointers Made])             
,[Min Three Pointers Attempted]        = min([Avg Three Pointers Attempted])        
,[Min Three Pointer %]                          = min([Avg Three Pointer %])                          
,[Min Offensive Rebounds]              = min([Avg Offensive Rebounds])              
,[Min Defensive Rebounds]              = min([Avg Defensive Rebounds])              
,[Min Total Rebounds]                  = min([Avg Total Rebounds])                  
,[Min Assists]                         = min([Avg Assists])                         
,[Min Personal Fouls]                  = min([Avg Personal Fouls])                  
,[Min Turnovers]                       = min([Avg Turnovers])                       
,[Min Blocks]                          = min([Avg Blocks])                          
-- MAX
,[Max Points Per Minute]                        = max([Avg Points Per Minute])
,[Max Plus Minus Per Minute]                    = max([Avg Plus Minus Per Minute])                    
,[Max Field Goals Made Per Minute]              = max([Avg Field Goals Made Per Minute])              
,[Max Field Goals Attempted Per Minute]         = max([Avg Field Goals Attempted Per Minute])         
,[Max Free Throws Made Per Minute]                = max([Avg Free Throws Made Per Minute])                
,[Max Free Throws Attempted Per Minute]           = max([Avg Free Throws Attempted Per Minute])           
,[Max Three Pointers Made Per Minute]             = max([Avg Three Pointers Made Per Minute])             
,[Max Three Pointers Attempted Per Minute]        = max([Avg Three Pointers Attempted Per Minute])  
,[Max Offensive Rebounds Per Minute]            = max([Avg Offensive Rebounds Per Minute])            
,[Max Defensive Rebounds Per Minute]            = max([Avg Defensive Rebounds Per Minute])            
,[Max Total Rebounds Per Minute]                = max([Avg Total Rebounds Per Minute])                
,[Max Assists Per Minute]                       = max([Avg Assists Per Minute])                       
,[Max Personal Fouls Per Minute]                = max([Avg Personal Fouls Per Minute])                
,[Max Turnovers Per Minute]                     = max([Avg Turnovers Per Minute])                     
,[Max Blocks Per Minute]                        = max([Avg Blocks Per Minute])                        
,[Max Points]                          = max([Avg Points])                          
,[Max Plus Minus]                      = max([Avg Plus Minus])                      
,[Max Field Goals Made]                = max([Avg Field Goals Made])                
,[Max Field Goals Attempted]           = max([Avg Field Goals Attempted])           
,[Max Field Goal %]                             = max([Avg Field Goal %])                             
,[Max Free Throws Made]                = max([Avg Free Throws Made])                
,[Max Free Throws Attempted]           = max([Avg Free Throws Attempted])           
,[Max Free Throw %]                             = max([Avg Free Throw %])                             
,[Max Three Pointers Made]             = max([Avg Three Pointers Made])             
,[Max Three Pointers Attempted]        = max([Avg Three Pointers Attempted])        
,[Max Three Pointer %]                          = max([Avg Three Pointer %])                          
,[Max Offensive Rebounds]              = max([Avg Offensive Rebounds])              
,[Max Defensive Rebounds]              = max([Avg Defensive Rebounds])              
,[Max Total Rebounds]                  = max([Avg Total Rebounds])                  
,[Max Assists]                         = max([Avg Assists])                         
,[Max Personal Fouls]                  = max([Avg Personal Fouls])                  
,[Max Turnovers]                       = max([Avg Turnovers])                       
,[Max Blocks]                          = max([Avg Blocks])
from NBA.VW_PlayerGameStats_Average
where [Time Played (Minutes)] >= 2500
group by 
[Team ID]
,[Season]

union all 

select 
[Group] = '>= 2000'
,[Team ID]
,[Season]
-- MIN
,[Min Points Per Minute]                        = min([Avg Points Per Minute])
,[Min Plus Minus Per Minute]                    = min([Avg Plus Minus Per Minute])                    
,[Min Field Goals Made Per Minute]              = min([Avg Field Goals Made Per Minute])              
,[Min Field Goals Attempted Per Minute]         = min([Avg Field Goals Attempted Per Minute]) 
,[Min Free Throws Made Per Minute]                = min([Avg Free Throws Made Per Minute])                
,[Min Free Throws Attempted Per Minute]           = min([Avg Free Throws Attempted Per Minute])           
,[Min Three Pointers Made Per Minute]             = min([Avg Three Pointers Made Per Minute])             
,[Min Three Pointers Attempted Per Minute]        = min([Avg Three Pointers Attempted Per Minute])        
,[Min Offensive Rebounds Per Minute]            = min([Avg Offensive Rebounds Per Minute])            
,[Min Defensive Rebounds Per Minute]            = min([Avg Defensive Rebounds Per Minute])            
,[Min Total Rebounds Per Minute]                = min([Avg Total Rebounds Per Minute])                
,[Min Assists Per Minute]                       = min([Avg Assists Per Minute])                       
,[Min Personal Fouls Per Minute]                = min([Avg Personal Fouls Per Minute])                
,[Min Turnovers Per Minute]                     = min([Avg Turnovers Per Minute])                     
,[Min Blocks Per Minute]                        = min([Avg Blocks Per Minute])                        
,[Min Points]                          = min([Avg Points])                          
,[Min Plus Minus]                      = min([Avg Plus Minus])                      
,[Min Field Goals Made]                = min([Avg Field Goals Made])                
,[Min Field Goals Attempted]           = min([Avg Field Goals Attempted])           
,[Min Field Goal %]                             = min([Avg Field Goal %])                             
,[Min Free Throws Made]                = min([Avg Free Throws Made])                
,[Min Free Throws Attempted]           = min([Avg Free Throws Attempted])           
,[Min Free Throw %]                             = min([Avg Free Throw %])                             
,[Min Three Pointers Made]             = min([Avg Three Pointers Made])             
,[Min Three Pointers Attempted]        = min([Avg Three Pointers Attempted])        
,[Min Three Pointer %]                          = min([Avg Three Pointer %])                          
,[Min Offensive Rebounds]              = min([Avg Offensive Rebounds])              
,[Min Defensive Rebounds]              = min([Avg Defensive Rebounds])              
,[Min Total Rebounds]                  = min([Avg Total Rebounds])                  
,[Min Assists]                         = min([Avg Assists])                         
,[Min Personal Fouls]                  = min([Avg Personal Fouls])                  
,[Min Turnovers]                       = min([Avg Turnovers])                       
,[Min Blocks]                          = min([Avg Blocks])                          
-- MAX
,[Max Points Per Minute]                        = max([Avg Points Per Minute])
,[Max Plus Minus Per Minute]                    = max([Avg Plus Minus Per Minute])                    
,[Max Field Goals Made Per Minute]              = max([Avg Field Goals Made Per Minute])              
,[Max Field Goals Attempted Per Minute]         = max([Avg Field Goals Attempted Per Minute])         
,[Max Free Throws Made Per Minute]                = max([Avg Free Throws Made Per Minute])                
,[Max Free Throws Attempted Per Minute]           = max([Avg Free Throws Attempted Per Minute])           
,[Max Three Pointers Made Per Minute]             = max([Avg Three Pointers Made Per Minute])             
,[Max Three Pointers Attempted Per Minute]        = max([Avg Three Pointers Attempted Per Minute])  
,[Max Offensive Rebounds Per Minute]            = max([Avg Offensive Rebounds Per Minute])            
,[Max Defensive Rebounds Per Minute]            = max([Avg Defensive Rebounds Per Minute])            
,[Max Total Rebounds Per Minute]                = max([Avg Total Rebounds Per Minute])                
,[Max Assists Per Minute]                       = max([Avg Assists Per Minute])                       
,[Max Personal Fouls Per Minute]                = max([Avg Personal Fouls Per Minute])                
,[Max Turnovers Per Minute]                     = max([Avg Turnovers Per Minute])                     
,[Max Blocks Per Minute]                        = max([Avg Blocks Per Minute])                        
,[Max Points]                          = max([Avg Points])                          
,[Max Plus Minus]                      = max([Avg Plus Minus])                      
,[Max Field Goals Made]                = max([Avg Field Goals Made])                
,[Max Field Goals Attempted]           = max([Avg Field Goals Attempted])           
,[Max Field Goal %]                             = max([Avg Field Goal %])                             
,[Max Free Throws Made]                = max([Avg Free Throws Made])                
,[Max Free Throws Attempted]           = max([Avg Free Throws Attempted])           
,[Max Free Throw %]                             = max([Avg Free Throw %])                             
,[Max Three Pointers Made]             = max([Avg Three Pointers Made])             
,[Max Three Pointers Attempted]        = max([Avg Three Pointers Attempted])        
,[Max Three Pointer %]                          = max([Avg Three Pointer %])                          
,[Max Offensive Rebounds]              = max([Avg Offensive Rebounds])              
,[Max Defensive Rebounds]              = max([Avg Defensive Rebounds])              
,[Max Total Rebounds]                  = max([Avg Total Rebounds])                  
,[Max Assists]                         = max([Avg Assists])                         
,[Max Personal Fouls]                  = max([Avg Personal Fouls])                  
,[Max Turnovers]                       = max([Avg Turnovers])                       
,[Max Blocks]                          = max([Avg Blocks])
from NBA.VW_PlayerGameStats_Average
where [Time Played (Minutes)] >= 2000
group by 
[Team ID]
,[Season]

union all 

select 
[Group] = '>= 1500'
,[Team ID]
,[Season]
-- MIN
,[Min Points Per Minute]                        = min([Avg Points Per Minute])
,[Min Plus Minus Per Minute]                    = min([Avg Plus Minus Per Minute])                    
,[Min Field Goals Made Per Minute]              = min([Avg Field Goals Made Per Minute])              
,[Min Field Goals Attempted Per Minute]         = min([Avg Field Goals Attempted Per Minute]) 
,[Min Free Throws Made Per Minute]                = min([Avg Free Throws Made Per Minute])                
,[Min Free Throws Attempted Per Minute]           = min([Avg Free Throws Attempted Per Minute])           
,[Min Three Pointers Made Per Minute]             = min([Avg Three Pointers Made Per Minute])             
,[Min Three Pointers Attempted Per Minute]        = min([Avg Three Pointers Attempted Per Minute])        
,[Min Offensive Rebounds Per Minute]            = min([Avg Offensive Rebounds Per Minute])            
,[Min Defensive Rebounds Per Minute]            = min([Avg Defensive Rebounds Per Minute])            
,[Min Total Rebounds Per Minute]                = min([Avg Total Rebounds Per Minute])                
,[Min Assists Per Minute]                       = min([Avg Assists Per Minute])                       
,[Min Personal Fouls Per Minute]                = min([Avg Personal Fouls Per Minute])                
,[Min Turnovers Per Minute]                     = min([Avg Turnovers Per Minute])                     
,[Min Blocks Per Minute]                        = min([Avg Blocks Per Minute])                        
,[Min Points]                          = min([Avg Points])                          
,[Min Plus Minus]                      = min([Avg Plus Minus])                      
,[Min Field Goals Made]                = min([Avg Field Goals Made])                
,[Min Field Goals Attempted]           = min([Avg Field Goals Attempted])           
,[Min Field Goal %]                             = min([Avg Field Goal %])                             
,[Min Free Throws Made]                = min([Avg Free Throws Made])                
,[Min Free Throws Attempted]           = min([Avg Free Throws Attempted])           
,[Min Free Throw %]                             = min([Avg Free Throw %])                             
,[Min Three Pointers Made]             = min([Avg Three Pointers Made])             
,[Min Three Pointers Attempted]        = min([Avg Three Pointers Attempted])        
,[Min Three Pointer %]                          = min([Avg Three Pointer %])                          
,[Min Offensive Rebounds]              = min([Avg Offensive Rebounds])              
,[Min Defensive Rebounds]              = min([Avg Defensive Rebounds])              
,[Min Total Rebounds]                  = min([Avg Total Rebounds])                  
,[Min Assists]                         = min([Avg Assists])                         
,[Min Personal Fouls]                  = min([Avg Personal Fouls])                  
,[Min Turnovers]                       = min([Avg Turnovers])                       
,[Min Blocks]                          = min([Avg Blocks])                          
-- MAX
,[Max Points Per Minute]                        = max([Avg Points Per Minute])
,[Max Plus Minus Per Minute]                    = max([Avg Plus Minus Per Minute])                    
,[Max Field Goals Made Per Minute]              = max([Avg Field Goals Made Per Minute])              
,[Max Field Goals Attempted Per Minute]         = max([Avg Field Goals Attempted Per Minute])         
,[Max Free Throws Made Per Minute]                = max([Avg Free Throws Made Per Minute])                
,[Max Free Throws Attempted Per Minute]           = max([Avg Free Throws Attempted Per Minute])           
,[Max Three Pointers Made Per Minute]             = max([Avg Three Pointers Made Per Minute])             
,[Max Three Pointers Attempted Per Minute]        = max([Avg Three Pointers Attempted Per Minute])  
,[Max Offensive Rebounds Per Minute]            = max([Avg Offensive Rebounds Per Minute])            
,[Max Defensive Rebounds Per Minute]            = max([Avg Defensive Rebounds Per Minute])            
,[Max Total Rebounds Per Minute]                = max([Avg Total Rebounds Per Minute])                
,[Max Assists Per Minute]                       = max([Avg Assists Per Minute])                       
,[Max Personal Fouls Per Minute]                = max([Avg Personal Fouls Per Minute])                
,[Max Turnovers Per Minute]                     = max([Avg Turnovers Per Minute])                     
,[Max Blocks Per Minute]                        = max([Avg Blocks Per Minute])                        
,[Max Points]                          = max([Avg Points])                          
,[Max Plus Minus]                      = max([Avg Plus Minus])                      
,[Max Field Goals Made]                = max([Avg Field Goals Made])                
,[Max Field Goals Attempted]           = max([Avg Field Goals Attempted])           
,[Max Field Goal %]                             = max([Avg Field Goal %])                             
,[Max Free Throws Made]                = max([Avg Free Throws Made])                
,[Max Free Throws Attempted]           = max([Avg Free Throws Attempted])           
,[Max Free Throw %]                             = max([Avg Free Throw %])                             
,[Max Three Pointers Made]             = max([Avg Three Pointers Made])             
,[Max Three Pointers Attempted]        = max([Avg Three Pointers Attempted])        
,[Max Three Pointer %]                          = max([Avg Three Pointer %])                          
,[Max Offensive Rebounds]              = max([Avg Offensive Rebounds])              
,[Max Defensive Rebounds]              = max([Avg Defensive Rebounds])              
,[Max Total Rebounds]                  = max([Avg Total Rebounds])                  
,[Max Assists]                         = max([Avg Assists])                         
,[Max Personal Fouls]                  = max([Avg Personal Fouls])                  
,[Max Turnovers]                       = max([Avg Turnovers])                       
,[Max Blocks]                          = max([Avg Blocks])
from NBA.VW_PlayerGameStats_Average
where [Time Played (Minutes)] >= 1500
group by 
[Team ID]
,[Season]

union all 

select 
[Group] = '>= 1000'
,[Team ID]
,[Season]
-- MIN
,[Min Points Per Minute]                        = min([Avg Points Per Minute])
,[Min Plus Minus Per Minute]                    = min([Avg Plus Minus Per Minute])                    
,[Min Field Goals Made Per Minute]              = min([Avg Field Goals Made Per Minute])              
,[Min Field Goals Attempted Per Minute]         = min([Avg Field Goals Attempted Per Minute]) 
,[Min Free Throws Made Per Minute]                = min([Avg Free Throws Made Per Minute])                
,[Min Free Throws Attempted Per Minute]           = min([Avg Free Throws Attempted Per Minute])           
,[Min Three Pointers Made Per Minute]             = min([Avg Three Pointers Made Per Minute])             
,[Min Three Pointers Attempted Per Minute]        = min([Avg Three Pointers Attempted Per Minute])        
,[Min Offensive Rebounds Per Minute]            = min([Avg Offensive Rebounds Per Minute])            
,[Min Defensive Rebounds Per Minute]            = min([Avg Defensive Rebounds Per Minute])            
,[Min Total Rebounds Per Minute]                = min([Avg Total Rebounds Per Minute])                
,[Min Assists Per Minute]                       = min([Avg Assists Per Minute])                       
,[Min Personal Fouls Per Minute]                = min([Avg Personal Fouls Per Minute])                
,[Min Turnovers Per Minute]                     = min([Avg Turnovers Per Minute])                     
,[Min Blocks Per Minute]                        = min([Avg Blocks Per Minute])                        
,[Min Points]                          = min([Avg Points])                          
,[Min Plus Minus]                      = min([Avg Plus Minus])                      
,[Min Field Goals Made]                = min([Avg Field Goals Made])                
,[Min Field Goals Attempted]           = min([Avg Field Goals Attempted])           
,[Min Field Goal %]                             = min([Avg Field Goal %])                             
,[Min Free Throws Made]                = min([Avg Free Throws Made])                
,[Min Free Throws Attempted]           = min([Avg Free Throws Attempted])           
,[Min Free Throw %]                             = min([Avg Free Throw %])                             
,[Min Three Pointers Made]             = min([Avg Three Pointers Made])             
,[Min Three Pointers Attempted]        = min([Avg Three Pointers Attempted])        
,[Min Three Pointer %]                          = min([Avg Three Pointer %])                          
,[Min Offensive Rebounds]              = min([Avg Offensive Rebounds])              
,[Min Defensive Rebounds]              = min([Avg Defensive Rebounds])              
,[Min Total Rebounds]                  = min([Avg Total Rebounds])                  
,[Min Assists]                         = min([Avg Assists])                         
,[Min Personal Fouls]                  = min([Avg Personal Fouls])                  
,[Min Turnovers]                       = min([Avg Turnovers])                       
,[Min Blocks]                          = min([Avg Blocks])                          
-- MAX
,[Max Points Per Minute]                        = max([Avg Points Per Minute])
,[Max Plus Minus Per Minute]                    = max([Avg Plus Minus Per Minute])                    
,[Max Field Goals Made Per Minute]              = max([Avg Field Goals Made Per Minute])              
,[Max Field Goals Attempted Per Minute]         = max([Avg Field Goals Attempted Per Minute])         
,[Max Free Throws Made Per Minute]                = max([Avg Free Throws Made Per Minute])                
,[Max Free Throws Attempted Per Minute]           = max([Avg Free Throws Attempted Per Minute])           
,[Max Three Pointers Made Per Minute]             = max([Avg Three Pointers Made Per Minute])             
,[Max Three Pointers Attempted Per Minute]        = max([Avg Three Pointers Attempted Per Minute])  
,[Max Offensive Rebounds Per Minute]            = max([Avg Offensive Rebounds Per Minute])            
,[Max Defensive Rebounds Per Minute]            = max([Avg Defensive Rebounds Per Minute])            
,[Max Total Rebounds Per Minute]                = max([Avg Total Rebounds Per Minute])                
,[Max Assists Per Minute]                       = max([Avg Assists Per Minute])                       
,[Max Personal Fouls Per Minute]                = max([Avg Personal Fouls Per Minute])                
,[Max Turnovers Per Minute]                     = max([Avg Turnovers Per Minute])                     
,[Max Blocks Per Minute]                        = max([Avg Blocks Per Minute])                        
,[Max Points]                          = max([Avg Points])                          
,[Max Plus Minus]                      = max([Avg Plus Minus])                      
,[Max Field Goals Made]                = max([Avg Field Goals Made])                
,[Max Field Goals Attempted]           = max([Avg Field Goals Attempted])           
,[Max Field Goal %]                             = max([Avg Field Goal %])                             
,[Max Free Throws Made]                = max([Avg Free Throws Made])                
,[Max Free Throws Attempted]           = max([Avg Free Throws Attempted])           
,[Max Free Throw %]                             = max([Avg Free Throw %])                             
,[Max Three Pointers Made]             = max([Avg Three Pointers Made])             
,[Max Three Pointers Attempted]        = max([Avg Three Pointers Attempted])        
,[Max Three Pointer %]                          = max([Avg Three Pointer %])                          
,[Max Offensive Rebounds]              = max([Avg Offensive Rebounds])              
,[Max Defensive Rebounds]              = max([Avg Defensive Rebounds])              
,[Max Total Rebounds]                  = max([Avg Total Rebounds])                  
,[Max Assists]                         = max([Avg Assists])                         
,[Max Personal Fouls]                  = max([Avg Personal Fouls])                  
,[Max Turnovers]                       = max([Avg Turnovers])                       
,[Max Blocks]                          = max([Avg Blocks])
from NBA.VW_PlayerGameStats_Average
where [Time Played (Minutes)] >= 1000
group by 
[Team ID]
,[Season]

union all 

select 
[Group] = '>= 0'
,[Team ID]
,[Season]
-- MIN
,[Min Points Per Minute]                        = min([Avg Points Per Minute])
,[Min Plus Minus Per Minute]                    = min([Avg Plus Minus Per Minute])                    
,[Min Field Goals Made Per Minute]              = min([Avg Field Goals Made Per Minute])              
,[Min Field Goals Attempted Per Minute]         = min([Avg Field Goals Attempted Per Minute]) 
,[Min Free Throws Made Per Minute]                = min([Avg Free Throws Made Per Minute])                
,[Min Free Throws Attempted Per Minute]           = min([Avg Free Throws Attempted Per Minute])           
,[Min Three Pointers Made Per Minute]             = min([Avg Three Pointers Made Per Minute])             
,[Min Three Pointers Attempted Per Minute]        = min([Avg Three Pointers Attempted Per Minute])        
,[Min Offensive Rebounds Per Minute]            = min([Avg Offensive Rebounds Per Minute])            
,[Min Defensive Rebounds Per Minute]            = min([Avg Defensive Rebounds Per Minute])            
,[Min Total Rebounds Per Minute]                = min([Avg Total Rebounds Per Minute])                
,[Min Assists Per Minute]                       = min([Avg Assists Per Minute])                       
,[Min Personal Fouls Per Minute]                = min([Avg Personal Fouls Per Minute])                
,[Min Turnovers Per Minute]                     = min([Avg Turnovers Per Minute])                     
,[Min Blocks Per Minute]                        = min([Avg Blocks Per Minute])                        
,[Min Points]                          = min([Avg Points])                          
,[Min Plus Minus]                      = min([Avg Plus Minus])                      
,[Min Field Goals Made]                = min([Avg Field Goals Made])                
,[Min Field Goals Attempted]           = min([Avg Field Goals Attempted])           
,[Min Field Goal %]                             = min([Avg Field Goal %])                             
,[Min Free Throws Made]                = min([Avg Free Throws Made])                
,[Min Free Throws Attempted]           = min([Avg Free Throws Attempted])           
,[Min Free Throw %]                             = min([Avg Free Throw %])                             
,[Min Three Pointers Made]             = min([Avg Three Pointers Made])             
,[Min Three Pointers Attempted]        = min([Avg Three Pointers Attempted])        
,[Min Three Pointer %]                          = min([Avg Three Pointer %])                          
,[Min Offensive Rebounds]              = min([Avg Offensive Rebounds])              
,[Min Defensive Rebounds]              = min([Avg Defensive Rebounds])              
,[Min Total Rebounds]                  = min([Avg Total Rebounds])                  
,[Min Assists]                         = min([Avg Assists])                         
,[Min Personal Fouls]                  = min([Avg Personal Fouls])                  
,[Min Turnovers]                       = min([Avg Turnovers])                       
,[Min Blocks]                          = min([Avg Blocks])                          
-- MAX
,[Max Points Per Minute]                        = max([Avg Points Per Minute])
,[Max Plus Minus Per Minute]                    = max([Avg Plus Minus Per Minute])                    
,[Max Field Goals Made Per Minute]              = max([Avg Field Goals Made Per Minute])              
,[Max Field Goals Attempted Per Minute]         = max([Avg Field Goals Attempted Per Minute])         
,[Max Free Throws Made Per Minute]                = max([Avg Free Throws Made Per Minute])                
,[Max Free Throws Attempted Per Minute]           = max([Avg Free Throws Attempted Per Minute])           
,[Max Three Pointers Made Per Minute]             = max([Avg Three Pointers Made Per Minute])             
,[Max Three Pointers Attempted Per Minute]        = max([Avg Three Pointers Attempted Per Minute])  
,[Max Offensive Rebounds Per Minute]            = max([Avg Offensive Rebounds Per Minute])            
,[Max Defensive Rebounds Per Minute]            = max([Avg Defensive Rebounds Per Minute])            
,[Max Total Rebounds Per Minute]                = max([Avg Total Rebounds Per Minute])                
,[Max Assists Per Minute]                       = max([Avg Assists Per Minute])                       
,[Max Personal Fouls Per Minute]                = max([Avg Personal Fouls Per Minute])                
,[Max Turnovers Per Minute]                     = max([Avg Turnovers Per Minute])                     
,[Max Blocks Per Minute]                        = max([Avg Blocks Per Minute])                        
,[Max Points]                          = max([Avg Points])                          
,[Max Plus Minus]                      = max([Avg Plus Minus])                      
,[Max Field Goals Made]                = max([Avg Field Goals Made])                
,[Max Field Goals Attempted]           = max([Avg Field Goals Attempted])           
,[Max Field Goal %]                             = max([Avg Field Goal %])                             
,[Max Free Throws Made]                = max([Avg Free Throws Made])                
,[Max Free Throws Attempted]           = max([Avg Free Throws Attempted])           
,[Max Free Throw %]                             = max([Avg Free Throw %])                             
,[Max Three Pointers Made]             = max([Avg Three Pointers Made])             
,[Max Three Pointers Attempted]        = max([Avg Three Pointers Attempted])        
,[Max Three Pointer %]                          = max([Avg Three Pointer %])                          
,[Max Offensive Rebounds]              = max([Avg Offensive Rebounds])              
,[Max Defensive Rebounds]              = max([Avg Defensive Rebounds])              
,[Max Total Rebounds]                  = max([Avg Total Rebounds])                  
,[Max Assists]                         = max([Avg Assists])                         
,[Max Personal Fouls]                  = max([Avg Personal Fouls])                  
,[Max Turnovers]                       = max([Avg Turnovers])                       
,[Max Blocks]                          = max([Avg Blocks])
from NBA.VW_PlayerGameStats_Average
where [Time Played (Minutes)] >= 0
group by 
[Team ID]
,[Season]

GO


