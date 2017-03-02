%% Behavioural Permutation Figure

% This figure produces a logical image (toplot>th) for each participant in
% each age group (younger/older) for each task (Gender/Expressive) and each
% beahvioural measure (Reaction time/% Correct)

% Logical image masks are averaged across participants. In this image each
% pixel ranges from 0 to the number of participants (24 in each age group)

% We are interested in seeing overlap at the features of interest (e.g.
% eyes in the gender task, mouth in the expression task)

%% Compure the logical image for each age group (Younger/Older), task (Gender/Expressive) and
% behavioural measure (RT / % Correct)

load permutation_gcmi_pix_beh


Younger = {'Py1','Py2','Py3','Py4','Py5','Py6','Py7','Py8','Py9','Py10','Py11','Py12','Py13','Py14','Py15','Py16','Py17','Py18','Py19','Py20','Py21','Py22','Py23','Py24'};
Older = {'Po1','Po2','Po3','Po4','Po5','Po6','Po7','Po8','Po9','Po10','Po11','Po12','Po13','Po14','Po15','Po16','Po17','Po18','Po19','Po20','Po22',};

Code_names = {'Younger','Older'}; 

for agegroup = 1:2 %Younger and Older calculated seperately
    
    Code = Code_names{agegroup};
    
    % Create empty matrixes the size of the bubble masks
    eval(['sum_exnex_corr_logical_',Code,' = zeros(294,253);'])
    eval(['sum_exnex_rt_logical_',Code,' = zeros(294,253);'])
    eval(['sum_gender_corr_logical_',Code,' = zeros(294,253);'])
    eval(['sum_gender_rt_logical_',Code,' = zeros(294,253);'])
    
    eval(['N = length(',Code,')'])
    
    % Work through participants in each age group seperately 
    for S = 1:N
        
        eval(['id =',Code,'{S}'])
        
        % Expressive task % correct
        eval(['toplot = permutation_gcmi_pix_beh.exnex_',id,'.corr;']) % load in behavioural permutation data
        eval(['th = permutation_gcmi_pix_beh.exnex_',id,'.corr_perm_th;']) % create logical image
        eval(['exnex_corr_logical_',Code,'.',id,' = toplot>th;']) % save logical image for each participant seperately
        eval(['sum_exnex_corr_logical_',Code,' = sum_exnex_corr_logical_',Code,' + (toplot>th);']) % save logical image sum for all participants 
        
        % Expressive task RT
        eval(['toplot = permutation_gcmi_pix_beh.exnex_',id,'.rt;'])
        eval(['th = permutation_gcmi_pix_beh.exnex_',id,'.rt_perm_th;'])
        eval(['exnex_rt_logical_',Code,'.',id,' = toplot>th;']);
        eval(['sum_exnex_rt_logical_',Code,' = sum_exnex_rt_logical_',Code,' + (toplot>th);'])
        
        % Gender task % correct
        eval(['toplot = permutation_gcmi_pix_beh.gender_',id,'.corr;'])
        eval(['th = permutation_gcmi_pix_beh.gender_',id,'.corr_perm_th;'])
        eval(['gender_corr_logical_',Code,'.',id,' = toplot>th;']);
        eval(['sum_gender_corr_logical_',Code,' = sum_gender_corr_logical_',Code,' + (toplot>th);'])
        
        % Gender task RT
        eval(['toplot = permutation_gcmi_pix_beh.gender_',id,'.rt;'])
        eval(['th = permutation_gcmi_pix_beh.gender_',id,'.rt_perm_th;'])
        eval(['gender_rt_logical_',Code,'.',id,' = toplot>th;']);
        eval(['sum_gender_rt_logical_',Code,' = sum_gender_rt_logical_',Code,' + (toplot>th);'])
        
    end
    
end

%% This cell creates a figure of the summed logical images for each age group in each task and behavioural comparison 

background = averageface; 
alphamap = ones( size(background,1), size(background,2) );
transp=0.8;
alphamap(alphamap==1)=transp;
set(0,'DefaultAxesFontSize',8)


for agegroup = 1:2 %Younger and Older calculated seperately
    
Code = Code_names{agegroup};

eval(['N = length(',Code,')'])

figure('Color','w','Name',['MI Behavioural Permutations ',Code],'NumberTitle','off','Units','Normalized','Position',[0.4 0.1 0.3 0.8])

suptitle(['MI Behavioural Permutations ',Code,])

subplot(2,2,1);hold on

eval(['toplot = sum_exnex_corr_logical_',Code,';'])  % change for rt / corr
    h = imagesc(toplot,[0 N]);
    image(background)
    set(h,'AlphaData', alphamap);
    set(gca,'YDir','reverse')
    h = imagesc(toplot,[0 N]);
    set(h,'AlphaData', alphamap);
    axis image
    axis off
    colorbar
    colormap(viridis)
    
    
    title('Exnex Corr')

subplot(2,2,2);hold on

eval(['toplot = sum_exnex_rt_logical_',Code,';'])  % change for rt / corr
    h = imagesc(toplot,[0 N]);
    image(background)
    set(h,'AlphaData', alphamap);
    set(gca,'YDir','reverse')
    h = imagesc(toplot,[0 N]);
    set(h,'AlphaData', alphamap);
    axis image
    axis off
    colorbar
    colormap(viridis)
    
    
    title('Exnex Rt')

    subplot(2,2,3);hold on

eval(['toplot = sum_gender_corr_logical_',Code,';'])  % change for rt / corr
    h = imagesc(toplot,[0 N]);
    image(background)
    set(h,'AlphaData', alphamap);
    set(gca,'YDir','reverse')
    h = imagesc(toplot,[0 N]);
    set(h,'AlphaData', alphamap);
    axis image
    axis off
    colorbar
    colormap(viridis)
    
    
    title('Gender Corr')

subplot(2,2,4);hold on

eval(['toplot = sum_gender_rt_logical_',Code,';'])  % change for rt / corr
    h = imagesc(toplot,[0 N]);
    image(background)
    set(h,'AlphaData', alphamap);
    set(gca,'YDir','reverse')
    h = imagesc(toplot,[0 N]);
    set(h,'AlphaData', alphamap);
    axis image
    axis off
    colorbar
    colormap(viridis)
    
    
    title('Gender Rt')
    
end 